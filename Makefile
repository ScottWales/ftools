PARSER_DIR=ftools/parser

ANTLR=java org.antlr.v4.Tool -Dlanguage=Python2
MKDIR=mkdir -p
SETUP=python setup.py

.PHONY: parser check

ALL: check

parser: ${PARSER_DIR}/Fortran03Parser.py

check: parser
	py.test

%Parser.py %Lexer.py: %.g4
	${ANTLR} $<

