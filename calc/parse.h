#ifndef PARSE_H
#define PARSE_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <ctype.h>

#define PARSE_VERSION "1.0.0"

// API

extern int args_have_us_units(const char *args);
extern const char *parse_named_param(const char *s, const char *key, double *out, int *found);
extern int parse_named_string_param(const char *s, const char *key, char *out, int out_len);
extern void set_var(const char *name, double val);
extern double get_var(const char *name);
#endif