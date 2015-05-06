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

def test_functionStmt():
    input = "function foo(bar)"
    out = parse(InputStream(input))
    stmt = out.functionStmt()
    assert stmt.getText() == "functionfoo(bar)"
    assert stmt.FUNCTION().getText() == "function"
    assert stmt.functionName().getText() == "foo"
    assert stmt.dummyArgNameList().getText() == "bar"

def test_name():
    input = "function function(subroutine)"
    out = parse(InputStream(input))
    stmt = out.functionStmt()
    assert stmt.functionName().getText() == "function"
    assert stmt.dummyArgNameList().getText() == "subroutine"

def test_subroutineSubprogram():
    input = "subroutine foo\nuse bar\nend\n"
    out = parse(InputStream(input))
    stmt = out.program().programUnit()[0].externalSubprogram().subroutineSubprogram()
    assert stmt.subroutineStmt().subroutineName().getText() == "foo"
    assert stmt.specificationPart().getText() == "usebar\n"
    assert stmt.specificationPart().useStmt()[0].getText() == "usebar\n"
