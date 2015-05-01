#!/usr/bin/env python
"""
Copyright 2015 ARC Centre of Excellence for Climate Systems Science

author: Scott Wales <scott.wales@unimelb.edu.au>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
"""

from ftools.parser.Fortran03Parser import Fortran03Parser as Parser
from ftools.parser.Fortran03Lexer import Fortran03Lexer as Lexer
from antlr4.InputStream import InputStream
from antlr4.CommonTokenStream import CommonTokenStream
from antlr4.atn.PredictionMode import PredictionMode

def test_empty():
    inp  = InputStream("")
    lex  = Lexer(inp)
    toks = CommonTokenStream(lex)
    par  = Parser(toks)
    tree = par.mainProgram()
    assert tree.programStmt().PROGRAM() == None

def test_program():
    inp  = InputStream("PROGRAM")
    lex  = Lexer(inp)
    toks = CommonTokenStream(lex)
    par  = Parser(toks)
    tree = par.mainProgram()
    assert tree.programStmt().PROGRAM() != None

def test_endprogram():
    inp  = InputStream("PROGRAM\nEND")
    lex  = Lexer(inp)
    toks = CommonTokenStream(lex)
    par  = Parser(toks)
    tree = par.mainProgram()
