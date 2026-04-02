#ifndef scalar_h
#define scalar_h

/* ═══════════════════════════════════════════════════════════
   SCALAR VARIABLE STORE
   A singly-linked list of name/value pairs on the heap.
   ═══════════════════════════════════════════════════════════ */
typedef struct Variable {
    char name[32];
    double value;
    struct Variable *next;
} Variable;

#endif