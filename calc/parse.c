#include "parse.h"
#include "scalar.h"
#include "matrix.h"
#include "reynolds.h"
#include "mannings.h"
#include "darcy.h"
#include "bernoulli.h"
#include "mohr.h"
#include "specheat.h"
#include "beam.h"
#include "orifice.h"
#include "stress.h"
#include "idealgas.h"
#include "conduct.h"
#include "pid.h"

Variable   *vars = NULL;
const char *expr;
double parse_expression();
double parse_comparison();
 
/*************************************************************
 * Function:    set_var
 * Input:       name (const char*) — null-terminated variable name (max 31 chars)
 *              val  (double)      — value to assign to the variable
 * Output:      void
 * Description: Searches the scalar variable linked list for an existing entry
 *              matching name and updates its value if found.
 *              If not found, allocates a new node and prepends it to the list.
 **************************************************************/
void set_var(const char *name, double val)
{
    Variable *varNode;
    Variable *newVar;
 
    for (varNode = vars; varNode; varNode = varNode->next)
    {
        if (strcmp(varNode->name, name) == 0)
        {
            varNode->value = val;
            return;
        }
    }
    newVar           = malloc(sizeof(Variable));
    strncpy(newVar->name, name, 31);
    newVar->name[31] = '\0';
    newVar->value    = val;
    newVar->next     = vars;
    vars             = newVar;
}
 
/*************************************************************
 * Function:    get_var
 * Input:       name (const char*) — null-terminated variable name to look up
 * Output:      double — the stored value, or 0 if the variable is not found
 * Description: Performs a linear search through the scalar variable list.
 *              Prints a warning message and returns 0 if the name is not found,
 *              allowing callers to proceed without crashing on unknown variables.
 **************************************************************/
double get_var(const char *name)
{
    Variable *varNode;
 
    for (varNode = vars; varNode; varNode = varNode->next)
        if (strcmp(varNode->name, name) == 0) return varNode->value;
    printf("Unknown variable: %s\n", name);

    return 0;
}
 
/*************************************************************
 * Function:    parse_factor
 * Input:       void — reads from the global cursor expr
 * Output:      double — the value of the highest-precedence operand at expr
 * Description: Handles the highest-precedence scalar operands: parenthesised
 *              sub-expressions, variable references ($name), built-in function
 *              calls (sin, cos, tan, sqrt, abs, log, exp), unary sign operators,
 *              and numeric literals.  Advances expr past all consumed characters.
 **************************************************************/
double parse_factor()
{
    char   name[32];
    char   funcName[16];
    int    charIdx;
    double argValue;
    char  *parseEnd;
    double result;
 
    while (isspace(*expr)) expr++;
 
    if (*expr == '(')
    {
        expr++;
        result = parse_comparison();
        if (*expr == ')') expr++;
        return result;
    }
 
    if (*expr == '$')
    {
        expr++;
        charIdx = 0;
        memset(name, 0, sizeof(name));
        while (isalnum(*expr) || *expr == '_') name[charIdx++] = *expr++;
        return get_var(name);
    }
 
    if (isalpha(*expr))
    {
        charIdx = 0;
        memset(funcName, 0, sizeof(funcName));
        while (isalpha(*expr)) funcName[charIdx++] = *expr++;
        argValue = parse_factor();
        if (strcmp(funcName, "sin")  == 0) return sin(argValue);
        if (strcmp(funcName, "cos")  == 0) return cos(argValue);
        if (strcmp(funcName, "tan")  == 0) return tan(argValue);
        if (strcmp(funcName, "sqrt") == 0) return sqrt(argValue);
        if (strcmp(funcName, "abs")  == 0) return fabs(argValue);
        if (strcmp(funcName, "log")  == 0) return log(argValue);
        if (strcmp(funcName, "exp")  == 0) return exp(argValue);
        printf("Unknown function: %s\n", funcName);
        return 0;
    }
 
    if (*expr == '-') { expr++; return -parse_factor(); }
    if (*expr == '+') { expr++; return  parse_factor(); }
 
    result = strtod(expr, &parseEnd);
    expr   = parseEnd;

    return result;
}
 
/*************************************************************
 * Function:    parse_term
 * Input:       void — reads from the global cursor expr
 * Output:      double — the value of the multiplicative sub-expression at expr
 * Description: Handles left-associative '*' and '/' operators at medium
 *              precedence by repeatedly calling parse_factor() for each operand.
 *              Advances expr past all consumed characters.
 **************************************************************/
double parse_term()
{
    double result;
    char   operatorChar;
    double rightOperand;
 
    result = parse_factor();
    while (isspace(*expr)) expr++;
    while (*expr == '*' || *expr == '/')
    {
        operatorChar = *expr++;
        rightOperand = parse_factor();
        result = (operatorChar == '*') ? result * rightOperand
                                       : result / rightOperand;
        while (isspace(*expr)) expr++;
    }

    return result;
}
 
/*************************************************************
 * Function:    parse_expression
 * Input:       void — reads from the global cursor expr
 * Output:      double — the value of the additive sub-expression at expr
 * Description: Handles left-associative '+' and '-' operators at the lowest
 *              arithmetic precedence by repeatedly calling parse_term() for
 *              each operand.  Advances expr past all consumed characters.
 **************************************************************/
double parse_expression()
{
    double result;
    char   operatorChar;
    double rightOperand;
 
    result = parse_term();
    while (isspace(*expr)) expr++;
    while (*expr == '+' || *expr == '-')
    {
        operatorChar = *expr++;
        rightOperand = parse_term();
        result = (operatorChar == '+') ? result + rightOperand
                                       : result - rightOperand;
        while (isspace(*expr)) expr++;
    }

    return result;
}
 
/* ═══════════════════════════════════════════════════════════
   MATRIX EXPRESSION PARSER
   ═══════════════════════════════════════════════════════════ */
 
Matrix *parse_mat_expr();
 
/*************************************************************
 * Function:    parse_mat_primary
 * Input:       void — reads from the global cursor expr
 * Output:      Matrix* — a newly allocated matrix, or NULL on parse error
 * Description: Handles the highest-precedence matrix operands: bracket literals
 *              ([r0c0 r0c1; r1c0 r1c1]), parenthesised sub-expressions, matrix
 *              variable references ($name), and named matrix functions
 *              (transpose, inv, scale).  Returns a caller-owned Matrix* on
 *              success or NULL on any parse or dimension error.
 **************************************************************/
Matrix *parse_mat_primary()
{
    double      literalVals[1024];
    int         totalElems;
    int         rowCount;
    int         colsPerRow;
    int         colsThisRow;
    char       *parseEnd;
    double      elemVal;
    char        varName[32];
    char        funcName[16];
    int         charIdx;
    Matrix     *parsedMatrix;
    Matrix     *argMatrix;
    Matrix     *resultMatrix;
    double      scaleValue;
 
    totalElems  = 0;
    rowCount    = 0;
    colsPerRow  = -1;
    colsThisRow = 0;
    charIdx     = 0;
    scaleValue  = 0;
    parsedMatrix  = NULL;
    argMatrix     = NULL;
    resultMatrix  = NULL;
 
    while (isspace(*expr)) expr++;
 
    if (*expr == '[')
    {
        expr++;
        while (*expr && *expr != ']')
        {
            while (*expr == ' ' || *expr == '\t') expr++;
            if (!*expr || *expr == ']') break;
            if (*expr == ';')
            {
                if (colsPerRow < 0)
                    colsPerRow = colsThisRow;
                else if (colsThisRow != colsPerRow)
                {
                    printf("matrix literal: row widths differ\n");
                    return NULL;
                }
                rowCount++;
                colsThisRow = 0;
                expr++;
                continue;
            }
            if (*expr == ',') { expr++; continue; }
            elemVal = strtod(expr, &parseEnd);
            if (parseEnd == expr) { expr++; continue; }
            if (totalElems < 1024) literalVals[totalElems++] = elemVal;
            colsThisRow++;
            expr = parseEnd;
        }
        if (*expr == ']') expr++;
        if (colsThisRow > 0)
        {
            if (colsPerRow < 0)
                colsPerRow = colsThisRow;
            else if (colsThisRow != colsPerRow)
            {
                printf("matrix literal: last row width differs\n");
                return NULL;
            }
            rowCount++;
        }
        if (rowCount == 0 || colsPerRow <= 0)
        {
            printf("matrix literal: empty matrix\n");
            return NULL;
        }
        parsedMatrix = mat_new(rowCount, colsPerRow);
        memcpy(parsedMatrix->data, literalVals, totalElems * sizeof(double));
        return parsedMatrix;
    }
 
    if (*expr == '(')
    {
        expr++;
        parsedMatrix = parse_mat_expr();
        while (isspace(*expr)) expr++;
        if (*expr == ')') expr++;
        return parsedMatrix;
    }
 
    if (*expr == '$')
    {
        expr++;
        charIdx = 0;
        memset(varName, 0, sizeof(varName));
        while (isalnum(*expr) || *expr == '_') varName[charIdx++] = *expr++;
        parsedMatrix = get_mat_var(varName);
        if (!parsedMatrix)
        {
            printf("Unknown matrix variable: $%s\n", varName);
            return NULL;
        }
        return mat_copy(parsedMatrix);
    }
 
    if (isalpha(*expr))
    {
        charIdx = 0;
        memset(funcName, 0, sizeof(funcName));
        while (isalpha(*expr)) funcName[charIdx++] = *expr++;
        while (isspace(*expr)) expr++;
        if (*expr == '(') expr++;
 
        if (strcmp(funcName, "transpose") == 0)
        {
            argMatrix = parse_mat_expr();
            while (isspace(*expr)) expr++;
            if (*expr == ')') expr++;
            if (!argMatrix) return NULL;
            resultMatrix = mat_transpose(argMatrix);
            mat_free(argMatrix);
            return resultMatrix;
        }
 
        if (strcmp(funcName, "inv") == 0)
        {
            argMatrix = parse_mat_expr();
            while (isspace(*expr)) expr++;
            if (*expr == ')') expr++;
            if (!argMatrix) return NULL;
            resultMatrix = mat_inv(argMatrix);
            mat_free(argMatrix);
            return resultMatrix;
        }
 
        if (strcmp(funcName, "scale") == 0)
        {
            argMatrix = parse_mat_expr();
            while (isspace(*expr)) expr++;
            if (*expr == ',') expr++;
            scaleValue   = parse_expression();
            while (isspace(*expr)) expr++;
            if (*expr == ')') expr++;
            if (!argMatrix) return NULL;
            resultMatrix = mat_scale(argMatrix, scaleValue);
            mat_free(argMatrix);
            return resultMatrix;
        }
 
        printf("Unknown matrix function: %s\n", funcName);
        while (*expr && *expr != ')') expr++;
        if (*expr == ')') expr++;
        return NULL;
    }
 
    printf("Matrix parse error near: %.12s\n", expr);

    return NULL;
}
 
/*************************************************************
 * Function:    parse_mat_term
 * Input:       void — reads from the global cursor expr
 * Output:      Matrix* — result of matrix multiplication chain, or NULL on error
 * Description: Handles left-associative matrix '*' (multiplication) by
 *              repeatedly calling parse_mat_primary() and mat_mul().
 *              Frees intermediate matrices and returns NULL if any operand
 *              or multiplication fails.
 **************************************************************/
Matrix *parse_mat_term()
{
    Matrix *resultMatrix;
    Matrix *rightMatrix;
    Matrix *tempMatrix;
 
    resultMatrix = parse_mat_primary();
    rightMatrix  = NULL;
    tempMatrix   = NULL;
 
    while (isspace(*expr)) expr++;

    while (*expr == '*')
    {
        expr++;
        rightMatrix  = parse_mat_primary();
        tempMatrix   = (resultMatrix && rightMatrix) ? mat_mul(resultMatrix, rightMatrix) : NULL;
        mat_free(resultMatrix);
        mat_free(rightMatrix);
        resultMatrix = tempMatrix;
        while (isspace(*expr)) expr++;
    }

    return resultMatrix;
}
 
/*************************************************************
 * Function:    parse_mat_expr
 * Input:       void — reads from the global cursor expr
 * Output:      Matrix* — result of matrix addition/subtraction chain, or NULL on error
 * Description: Handles left-associative matrix '+' and '-' operators at the
 *              lowest matrix precedence by repeatedly calling parse_mat_term().
 *              Frees intermediate matrices and returns NULL if any operand
 *              or operation fails.
 **************************************************************/
Matrix *parse_mat_expr()
{
    Matrix *resultMatrix;
    Matrix *rightMatrix;
    Matrix *tempMatrix;
    char    operatorChar;
 
    resultMatrix = parse_mat_term();
    rightMatrix  = NULL;
    tempMatrix   = NULL;
    operatorChar = 0;
 
    while (isspace(*expr)) expr++;

    while (*expr == '+' || *expr == '-')
    {
        operatorChar = *expr++;
        rightMatrix  = parse_mat_term();
        tempMatrix   = NULL;
        if (resultMatrix && rightMatrix)
            tempMatrix = (operatorChar == '+') ? mat_add(resultMatrix, rightMatrix)
                                               : mat_sub(resultMatrix, rightMatrix);
        mat_free(resultMatrix);
        mat_free(rightMatrix);
        resultMatrix = tempMatrix;
        while (isspace(*expr)) expr++;
    }

    return resultMatrix;
}
 
/*************************************************************
 * Function:    is_matrix_context
 * Input:       s (const char*) — the expression string to scan
 * Output:      int — 1 if the expression involves matrix operands, 0 otherwise
 * Description: Scans the expression string for indicators that the expression
 *              involves matrices: a '[' literal, a $name that resolves to a
 *              known matrix variable, or a matrix function keyword
 *              (transpose, inv, scale).
 *              Used by the REPL to decide whether to invoke the matrix or scalar
 *              parser.
 **************************************************************/
int is_matrix_context(const char *s)
{
    char varName[32] = {};
    char keyword[16] = {};
    int  charIdx = 0;
 
    while (*s)
    {
        if (*s == '[') return 1;
        if (*s == '$')
        {
            s++;
            charIdx = 0;
            memset(varName, 0, sizeof(varName));
            while (isalnum(*s) || *s == '_') varName[charIdx++] = *s++;
            if (is_mat_var(varName)) return 1;
            continue;
        }
        if (isalpha(*s))
        {
            charIdx = 0;
            memset(keyword, 0, sizeof(keyword));
            while (isalpha(*s) && charIdx < 15) keyword[charIdx++] = *s++;
            if (strcmp(keyword, "transpose") == 0) return 1;
            if (strcmp(keyword, "inv")       == 0) return 1;
            if (strcmp(keyword, "scale")     == 0) return 1;
            continue;
        }
        s++;
    }

    return 0;
}
 
/*************************************************************
 * Function:    parse_comparison
 * Input:       void — reads from the global cursor expr
 * Output:      double — 1.0 if the comparison is true, 0.0 if false,
 *              or the numeric result if no comparison operator is present
 * Description: Handles all six comparison operators (==, !=, <, >, <=, >=)
 *              at the lowest precedence level, above parse_expression.
 *              Two-character operators are checked before single-character ones
 *              to prevent '<' consuming the first character of '<='.
 *              Floating-point equality uses an epsilon of 1e-9.
 *              This is the top-level entry point for all scalar parsing.
 **************************************************************/
double parse_comparison()
{
    double result = parse_expression();
    double rightOperand = 0;
    int    operatorCode = 0;
 
    while (isspace(*expr)) expr++;

    while (1)
    {
        operatorCode = 0;
        if      (expr[0] == '=' && expr[1] == '=') { operatorCode = 1; expr += 2; }
        else if (expr[0] == '!' && expr[1] == '=') { operatorCode = 2; expr += 2; }
        else if (expr[0] == '<' && expr[1] == '=') { operatorCode = 3; expr += 2; }
        else if (expr[0] == '>' && expr[1] == '=') { operatorCode = 4; expr += 2; }
        else if (expr[0] == '<')                   { operatorCode = 5; expr += 1; }
        else if (expr[0] == '>')                   { operatorCode = 6; expr += 1; }
        else break;
 
        rightOperand = parse_expression();

        switch (operatorCode)
        {
            case 1: result = (fabs(result - rightOperand) <  1e-9)                        ? 1.0 : 0.0; break; /* == */
            case 2: result = (fabs(result - rightOperand) >= 1e-9)                        ? 1.0 : 0.0; break; /* != */
            case 3: result = (result < rightOperand || fabs(result - rightOperand) < 1e-9) ? 1.0 : 0.0; break; /* <= */
            case 4: result = (result > rightOperand || fabs(result - rightOperand) < 1e-9) ? 1.0 : 0.0; break; /* >= */
            case 5: result = (result < rightOperand)                                       ? 1.0 : 0.0; break; /* <  */
            case 6: result = (result > rightOperand)                                       ? 1.0 : 0.0; break; /* >  */
        }

        while (isspace(*expr)) expr++;
    }

    return result;
}
 
/*************************************************************
 * Function:    parse_named_param
 * Input:       inputStr (const char*) — the full args string to search
 *              key      (const char*) — the parameter name to find (e.g. "f")
 *              outValue (double*)     — receives the parsed numeric value
 *              found    (int*)        — set to 1 if the key was found
 * Output:      const char* — pointer past the consumed value, or inputStr if not found
 * Description: Scans inputStr token by token for a match of the form KEY=<expr>.
 *              When found, the scalar expression following '=' is evaluated via
 *              parse_comparison() and the result written to *outValue.
 *              Parameter values may be any valid scalar expression.
 **************************************************************/
const char *parse_named_param(const char *inputStr, const char *key,
                               double *outValue, int *found)
{
    size_t      keyLen = strlen(key);
    const char *scanPtr = inputStr;;
 
    while (*scanPtr)
    {
        while (*scanPtr && isspace(*scanPtr)) scanPtr++;

        if (strncmp(scanPtr, key, keyLen) == 0 && scanPtr[keyLen] == '=')
        {
            expr     = scanPtr + keyLen + 1;
            *outValue = parse_comparison();
            *found   = 1;
            return expr;
        }

        while (*scanPtr && !isspace(*scanPtr)) scanPtr++;
    }

    return inputStr;
}
 
/*************************************************************
 * Function:    parse_named_string_param
 * Input:       inputStr  (const char*) — the full args string to search
 *              key       (const char*) — the parameter name to find (e.g. "solve")
 *              outBuffer (char*)       — receives the parsed string value
 *              bufferLen (int)         — maximum characters to write including '\0'
 * Output:      int — 1 if the key was found and outBuffer was filled, 0 otherwise
 * Description: Scans inputStr token by token for a match of the form KEY=<word>.
 *              When found, copies the word following '=' into outBuffer up to
 *              bufferLen-1 characters and null-terminates it.
 *              Used for non-numeric parameters such as solve=, type=, and units=.
 **************************************************************/
int parse_named_string_param(const char *inputStr, const char *key,
                              char *outBuffer, int bufferLen)
{
    size_t      keyLen = strlen(key);
    const char *scanPtr = inputStr;
    int         charIdx = 0;
 
    while (*scanPtr)
    {
        while (*scanPtr && isspace(*scanPtr)) scanPtr++;
        if (strncmp(scanPtr, key, keyLen) == 0 && scanPtr[keyLen] == '=')
        {
            scanPtr += keyLen + 1;
            charIdx  = 0;
            while (*scanPtr && !isspace(*scanPtr) && charIdx < bufferLen - 1)
                outBuffer[charIdx++] = *scanPtr++;
            outBuffer[charIdx] = '\0';
            return 1;
        }
        while (*scanPtr && !isspace(*scanPtr)) scanPtr++;
    }

    return 0;
}
 
/*************************************************************
 * Function:    args_have_us_units
 * Input:       args (const char*) — the full args string to search
 * Output:      int — 1 if the token "units=us" is present, 0 otherwise
 * Description: Scans args token by token for the literal string "units=us".
 *              Used by physics command handlers to select US customary unit
 *              constants and labels instead of SI defaults.
 **************************************************************/
int args_have_us_units(const char *args)
{
    const char *scanPtr = args;
 
    while (*scanPtr)
    {
        while (*scanPtr && isspace(*scanPtr)) scanPtr++;
        if (strncmp(scanPtr, "units=us", 8) == 0) return 1;
        while (*scanPtr && !isspace(*scanPtr)) scanPtr++;
    }

    return 0;
}
    
/*************************************************************
 * Function:    print_help
 * Input:       void
 * Output:      void — help text is printed to stdout
 * Description: Prints the complete command reference for the math shell,
 *              covering scalar and matrix operators, all physics commands,
 *              and shell meta-commands.  Called when the user types '?'.
 **************************************************************/
void print_help()
{
    printf(
        "\n"
        "  Math Shell — command reference\n"
        "  ─────────────────────────────────────────────────────\n"
        "  Scalar operators\n"
        "    +  -  *  /           arithmetic\n"
        "    ( )                  grouping\n"
        "    -x                   unary negation\n"
        "\n"
        "  Scalar functions\n"
        "    sin(x)  cos(x)  tan(x)    trig\n"
        "    sqrt(x) abs(x)            root / absolute value\n"
        "    log(x)  exp(x)            natural log / exponential\n"
        "\n"
        "  Scalar variables\n"
        "    $name = expr         assign\n"
        "    $name                use in an expression\n"
        "\n"
        "  Matrix literals\n"
        "    [1 2 3; 4 5 6]       2x3 matrix  (';' separates rows)\n"
        "    [1, 2; 3, 4]         commas optional\n"
        "\n"
        "  Matrix operators\n"
        "    $A + $B              element-wise addition\n"
        "    $A - $B              element-wise subtraction\n"
        "    $A * $B              matrix multiplication\n"
        "\n"
        "  Matrix functions\n"
        "    transpose($A)        transpose\n"
        "    inv($A)              inverse  (square only)\n"
        "    scale($A, k)         multiply every element by k\n"
        "    det($A)              determinant  (printed as scalar)\n"
        "\n"
        "  ── Hydraulics ────────────────────────────────────────\n"
        "  Manning's Equation\n"
        "    manning n=<> R=<> S=<> [A=<>] [D=<>] [units=si|us]\n"
        "    manning ?            roughness coefficient table\n"
        "    -> stores $manning_V, $manning_Q, $manning_Fr\n"
        "\n"
        "  ── Fluid Mechanics ───────────────────────────────────\n"
        "  Reynolds Number\n"
        "    reynolds V=<> D=<> nu=<>\n"
        "    reynolds V=<> D=<> rho=<> mu=<>\n"
        "    -> stores $Re\n"
        "\n"
        "  Darcy-Weisbach (pipe head loss)\n"
        "    darcy f=<> L=<> D=<> V=<> [units=si|us]\n"
        "    -> stores $darcy_hf, $darcy_dP_rho\n"
        "\n"
        "  Bernoulli's Equation\n"
        "    bernoulli P1=<> V1=<> z1=<> P2=<> V2=<> z2=<> [rho=<>] solve=<P1|V1|z1|P2|V2|z2>\n"
        "    -> stores $bern_P1/V1/z1/P2/V2/z2\n"
        "\n"
        "  Orifice Flow\n"
        "    orifice Cd=<> A=<> h=<> [units=si|us]\n"
        "    -> stores $orifice_Q, $orifice_V\n"
        "\n"
        "  ── Structural Mechanics ──────────────────────────────\n"
        "  Beam Deflection\n"
        "    beam type=ss|cant load=point|udl P=<>|w=<> L=<> E=<> I=<>\n"
        "    -> stores $beam_delta, $beam_Mmax, $beam_R\n"
        "\n"
        "  Axial Stress / Strain\n"
        "    stress F=<> A=<> [E=<>] [L=<>]\n"
        "    -> stores $stress_sigma, $stress_eps, $stress_delta\n"
        "\n"
        "  Mohr's Circle\n"
        "    mohrs sx=<> sy=<> txy=<>\n"
        "    -> stores $mohrs_s1, $mohrs_s2, $mohrs_tmax, $mohrs_theta\n"
        "\n"
        "  ── Thermodynamics ────────────────────────────────────\n"
        "  Ideal Gas Law  (PV = nRT)\n"
        "    idealgas P=<> V=<> n=<> T=<> [units=si|us] solve=<P|V|n|T>\n"
        "    -> stores $gas_P, $gas_V, $gas_n, $gas_T\n"
        "\n"
        "  Heat Conduction  (Fourier's Law)\n"
        "    conduction k=<> A=<> dT=<> L=<> [units=si|us]\n"
        "    -> stores $cond_Q, $cond_flux, $cond_Rth\n"
        "\n"
        "  Specific Heat  (Q = mc * dT)\n"
        "    specificheat m=<> c=<> dT=<>             (solves Q)\n"
        "    specificheat solve=<Q|m|c|dT> ...        (solve for any variable)\n"
        "    -> stores $heat_Q, $heat_m, $heat_c, $heat_dT\n"
        "\n"
        "  ── Control Systems ───────────────────────────────────\n"
        "  PID Controller\n"
        "    pid step  Kp=<> Ki=<> Kd=<> sp=<> pv=<> dt=<>\n"
        "              [imin=<> imax=<>]  [omin=<> omax=<>]\n"
        "    -> stores $pid_out, $pid_error, $pid_integral, $pid_prev_err\n"
        "    Note: $pid_integral and $pid_prev_err persist across calls.\n"
        "\n"
        "    pid sim   Kp=<> Ki=<> Kd=<> sp=<> pv0=<> dt=<> n=<>\n"
        "              gain=<> tau=<>  [imin=<> imax=<>]  [omin=<> omax=<>]\n"
        "    -> simulates n steps; prints table; stores $pid_pv, $pid_out\n"
        "    Plant model: tau*dpv/dt = gain*u - pv  (Euler discretised)\n"
        "\n"
        "    pid tune  method=zn   Ku=<> Tu=<>         [type=P|PI|PID]\n"
        "    pid tune  method=znol K=<> L=<> tau=<>    [type=P|PI|PID]\n"
        "    pid tune  method=cc   K=<> L=<> tau=<>    [type=P|PI|PID]\n"
        "    -> stores $pid_Kp, $pid_Ki, $pid_Kd, $pid_Ti, $pid_Td\n"
        "    Methods: zn=Ziegler-Nichols ultimate-gain\n"
        "             znol=Ziegler-Nichols open-loop (reaction curve)\n"
        "             cc=Cohen-Coon\n"
        "\n"
        "    pid reset            zero $pid_integral and $pid_prev_err\n"
        "\n"
        "  ── Shell Commands ────────────────────────────────────\n"
        "    ?                    show this help\n"
        "    vars                 list scalar variables\n"
        "    mats                 list matrix variables\n"
        "    exit                 quit\n"
        "\n"
        "  All parameter values accept full scalar expressions:\n"
        "    manning R=$r S=1/500 A=$w*$d\n"
        "    beam    L=6 E=200e9 I=8.33e-6 P=$load\n"
        "    pid sim Kp=$pid_Kp Ki=$pid_Ki Kd=$pid_Kd sp=100 pv0=0 dt=0.05 n=200 gain=1 tau=2\n"
        "  ─────────────────────────────────────────────────────\n"
        "\n"
    );
}
 
/*************************************************************
 * Function:    list_vars
 * Input:       void
 * Output:      void — variable listing is printed to stdout
 * Description: Iterates the scalar variable linked list and prints each
 *              variable name and value in a formatted table.
 *              Prints a message if no scalar variables have been defined.
 **************************************************************/
void list_vars()
{
    Variable *varNode = NULL;
 
    if (!vars) { 
        printf("  (no scalar variables defined)\n"); 
    } else {
        printf("\n  Scalar variables:\n");

        for (varNode = vars; varNode; varNode = varNode->next)
            printf("    $%-20s = %g\n", varNode->name, varNode->value);

        printf("\n");
    }
}
 
/*************************************************************
 * Function:    list_mat_vars
 * Input:       void
 * Output:      void — matrix variable listing is printed to stdout
 * Description: Iterates the matrix variable linked list and prints each
 *              variable name, dimensions, and contents using mat_print().
 *              Prints a message if no matrix variables have been defined.
 **************************************************************/
void list_mat_vars()
{
    MatVar *varNode;
 
    if (!mat_vars) {
        printf("  (no matrix variables defined)\n"); 
    } else {
        printf("\n  Matrix variables:\n");
        for (varNode = mat_vars; varNode; varNode = varNode->next)
        {
            printf("    $%s  [%dx%d]\n", varNode->name,
                varNode->mat->rows, varNode->mat->cols);
            mat_print(varNode->mat, NULL);
        }

        printf("\n");
    }
}
 
/* ═══════════════════════════════════════════════════════════
   MAIN REPL
   ═══════════════════════════════════════════════════════════ */
 
/*************************************************************
 * Function:    main
 * Input:       void — commands are read from stdin
 * Output:      int  — returns 0 on normal exit
 * Description: Runs the read-eval-print loop for the math shell.
 *              Each input line is classified and dispatched to the appropriate
 *              handler: built-in commands, physics solvers, variable assignment,
 *              matrix expressions, or scalar expressions.
 *              Lines beginning with '#' are treated as comments and ignored.
 *              The loop exits when the user types "exit".
 **************************************************************/
int main()
{
    char        inputLine[512] = {};
    const char *trimmedLine = NULL;
    const char *equalSign = NULL;
    char        varName[32] = {};
    char       *nameEnd = NULL;
    const char *rhsStart = NULL;
    Matrix     *parsedMatrix = NULL;
    double      scalarVal = 0;
    const char *detStart = NULL;

    memset(varName, 0, sizeof(varName));
 
    printf("Math Shell (type '?' for help, 'exit' to quit)\n");
 
    while (printf("> ") &&
           fgets(inputLine, sizeof(inputLine), stdin) &&
           strncmp(inputLine, "exit", 4) != 0)
    {
        /* ── Comments ── */
        trimmedLine = inputLine;
        while (isspace(*trimmedLine)) trimmedLine++;
        if (*trimmedLine == '#') continue;
 
        /* ── Built-in commands ── */
        if (inputLine[0] == '?')                           { print_help();                 continue; }
        if (strncmp(inputLine, "vars",        4)  == 0)    { list_vars();                  continue; }
        if (strncmp(inputLine, "mats",        4)  == 0)    { list_mat_vars();              continue; }
 
        /* ── Hydraulics ── */
        if (strncmp(inputLine, "manning",     7)  == 0)    { run_manning(inputLine + 7);   continue; }
 
        /* ── Fluid mechanics ── */
        if (strncmp(inputLine, "reynolds",    8)  == 0)    { run_reynolds(inputLine + 8);  continue; }
        if (strncmp(inputLine, "bernoulli",   9)  == 0)    { run_bernoulli(inputLine + 9); continue; }
        if (strncmp(inputLine, "orifice",     7)  == 0)    { run_orifice(inputLine + 7);   continue; }
        if (strncmp(inputLine, "darcy",       5)  == 0)    { run_darcy(inputLine + 5);     continue; }
 
        /* ── Structural mechanics ── */
        if (strncmp(inputLine, "stress",      6)  == 0)    { run_stress(inputLine + 6);    continue; }
        if (strncmp(inputLine, "mohrs",       5)  == 0)    { run_mohrs(inputLine + 5);     continue; }
        if (strncmp(inputLine, "beam",        4)  == 0)    { run_beam(inputLine + 4);      continue; }
 
        /* ── Thermodynamics ── */
        if (strncmp(inputLine, "specificheat", 12) == 0)   { run_specificheat(inputLine + 12); continue; }
        if (strncmp(inputLine, "idealgas",    8)  == 0)    { run_idealgas(inputLine + 8);  continue; }
        if (strncmp(inputLine, "conduction",  10) == 0)    { run_conduction(inputLine + 10); continue; }

        /* ── Control systems ── */
        if (strncmp(inputLine, "pid",         3)  == 0)    { run_pid(inputLine + 3);       continue; }
 
        /* ── Variable assignment: $name = rhs (but not $name == expr) ── */

        equalSign = strchr(inputLine, '=');

        if (inputLine[0] == '$' && equalSign &&
            equalSign[1] != '=' && equalSign[-1] != '!' &&
            equalSign[-1] != '<' && equalSign[-1] != '>')
        {
            memset(varName, 0, sizeof(varName));
            sscanf(inputLine + 1, "%31[^=]", varName);
            nameEnd = varName + strlen(varName) - 1;

            while (nameEnd >= varName && isspace(*nameEnd)) *nameEnd-- = '\0';
            rhsStart = equalSign + 1;

            if (is_matrix_context(rhsStart))
            {
                expr = rhsStart;
                parsedMatrix = parse_mat_expr();
                if (parsedMatrix)
                {
                    set_mat_var(varName, parsedMatrix);
                    mat_print(parsedMatrix, varName);
                }
            }
            else
            {
                expr      = rhsStart;
                scalarVal = parse_comparison();
                set_var(varName, scalarVal);
                printf("$%s = %g\n", varName, scalarVal);
            }
            continue;
        }
 
        /* ── det($A) — result is a scalar ── */
        detStart = inputLine;
        while (isspace(*detStart)) detStart++;
        if (strncmp(detStart, "det(", 4) == 0)
        {
            expr = detStart + 4;
            parsedMatrix = parse_mat_expr();
            while (isspace(*expr)) expr++;
            if (*expr == ')') expr++;
            if (parsedMatrix) { printf("%g\n", mat_det(parsedMatrix)); mat_free(parsedMatrix); }
            continue;
        }
 
        /* ── Matrix or scalar expression ── */
        if (is_matrix_context(inputLine))
        {
            expr = inputLine;
            parsedMatrix = parse_mat_expr();
            if (parsedMatrix) { mat_print(parsedMatrix, NULL); mat_free(parsedMatrix); }
        } else {
            expr = inputLine;
            printf("%g\n", parse_comparison());
        }
    }

    return 0;
}
