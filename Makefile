GRAMMAR=fortran03
PARSER_DIR=lib/parser

ANTLR=java org.antlr.v4.Tool -Dlanguage=Python2
MKDIR=mkdir -p
SETUP=python setup.py

.PHONY: ALL parser build

ALL:

parser: ${PARSER_DIR}/fortran03Parser.py

build: parser
	${SETUP} build

develop: parser
	${SETUP} develop --user

install: parser
	${SETUP} install

%Parser.py %Lexer.py: %.g4
	${ANTLR} $<

