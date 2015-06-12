#!/usr/bin/env python
"""
Copyright 2015 Scott Wales

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

from ftools import Parser, Format

def run_format(test):
    parser = Parser().parse_string(test)
    return str(Format(parser))

def test_basic():
    test = """
    PROGRAM foo
    END PROGRAM
    """
    expect = test
    assert run_format(test) == expect

def test_indent():
    test = """
    PROGRAM foo 
    INTEGER bar
    END PROGRAM
    """
    expect = """
    PROGRAM foo 
        INTEGER bar
    END PROGRAM
    """
    assert run_format(test) == expect

def test_indent_comments():
    test = """
    PROGRAM foo 
    ! retain
    INTEGER bar ! retain
    ! retain
    END PROGRAM
    """
    expect = """
    PROGRAM foo 
        ! retain
        INTEGER bar ! retain
        ! retain
    END PROGRAM
    """
    assert run_format(test) == expect
