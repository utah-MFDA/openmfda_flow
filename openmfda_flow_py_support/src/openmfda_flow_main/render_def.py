
# this file can semi-read make files for environment variables
import ply.lex as lex
import ply.yacc as yacc


RESERVED = [
    "ifneq",
    "ifeq",
    "endif"
]

tokens = [
    "VAR",
    "RBKT",
    "LBKT",
    "RBRC",
    "LBRC",
    "RPAR",
    "LPAR",
    "EQL",
    "EQLCOL",
    "EQLPLS",
    "EQLQST",
    "COL",
    "APND_LINE"
]

t_VAR = r"[A-Za-z_][A-Za-z1-9_]*"
t_RBKT = r"]"
t_LBKT = r"["
t_RBRC = r"}"
t_LBRC = r"{"
t_RPAR = r"("
t_LPAR = r")"
t_EQL = r"="
t_EQLCOL = r":="
t_EQLPLS = r"?="
t_EQLQST = r"+="
t_COL = r":"
t_APND_LINE = r"\/n"

lexer = lex.lex()


def p_rule(p):
    """rule : VAR_LIST COL VAR_LIST
    """
    return


def p_lazy_set(p):
    """
        """


def p_append_set(p):
    """
        """

def 
