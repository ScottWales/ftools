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

from ftools.parser import parse
from antlr4.InputStream import InputStream
from antlr4.error.ErrorStrategy import BailErrorStrategy

def parse_testcase(input):
    out = parse(InputStream(input))
    out._errHandler = BailErrorStrategy()
    return out


def test_functionStmt():
    input = "function foo(bar)\n"
    out = parse_testcase(input)
    stmt = out.functionStmt()
    assert stmt.getText() == "functionfoo(bar)\n"
    assert stmt.FUNCTION().getText() == "function"
    assert stmt.functionName().getText() == "foo"
    assert stmt.dummyArgNameList().getText() == "bar"

#def test_name():
#    input = "function function(subroutine)\n"
#    out = parse(InputStream(input))
#    stmt = out.functionStmt()
#    assert stmt.functionName().getText() == "function"
#    assert stmt.dummyArgNameList().getText() == "subroutine"

def test_subroutineSubprogram():
    input = "subroutine foo\nuse bar\nend\n"
    out = parse_testcase(input)
    stmt = out.subroutineSubprogram()
    assert stmt.subroutineStmt().subroutineName().getText() == "foo"
    assert stmt.specificationPart().getText() == "usebar\n"
    assert stmt.executionPart() == None
    assert stmt.internalSubprogramPart() == None
    assert stmt.endSubroutineStmt().getText() == "end\n"

def test_endSubroutineStmt():
    input = "end\n"
    out = parse_testcase(input)
    stmt = out.endSubroutineStmt()
    assert stmt.getText() == "end\n"

def test_specificationPart():
    input = ""
    out = parse_testcase(input)
    stmt = out.specificationPart()
    assert stmt.children == None
    assert stmt.useStmt() == []
    assert stmt.importStmt() == []
    assert stmt.implicitPart() == None
    assert stmt.declarationConstruct() == []

    input = """use foo
         use bar
         """
    out = parse_testcase(input)
    stmt = out.specificationPart()
    assert stmt.useStmt(0).getText() == "usefoo\n"
    assert stmt.useStmt(1).getText() == "usebar\n"
    assert stmt.importStmt() == []

    input = """use foo
         import foo
         implicit none
         integer foo
         integer bar
         """
    out = parse_testcase(input)
    stmt = out.specificationPart()
    assert stmt.useStmt(0).getText() == "usefoo\n"
    assert stmt.importStmt(0).getText() == "importfoo\n"
    assert stmt.implicitPart().getText() == "implicitnone\n"
    assert stmt.declarationConstruct(0).getText() == "integerfoo\n"
    assert stmt.declarationConstruct(1).getText() == "integerbar\n"
    assert stmt.declarationConstruct(2) == None
    assert stmt.getText() == "usefoo\nimportfoo\nimplicitnone\nintegerfoo\nintegerbar\n"

def test_mainProgram():
    input = "program foo\nend\n"
    out = parse_testcase(input)
    stmt = out.mainProgram()
    assert stmt.programStmt().getText() == "programfoo\n"
    assert stmt.specificationPart().children == None
    assert stmt.executionPart() == None
    assert stmt.internalSubprogramPart() == None
    assert stmt.endProgramStmt().getText() == "end\n"

def test_name():
    input = "abc123_fgh"
    out = parse_testcase(input)
    stmt = out.name()
    assert stmt.getText() == input
