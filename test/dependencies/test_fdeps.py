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

from ftools.dependencies import *
from antlr4.InputStream import InputStream

def test_subroutine_use():
    input = """
    subroutine foo
        use bar
    end
    """
    deps = string_dependencies(input, 'test.f90')
    assert deps.uses == set(['bar'])
    assert deps.requires() == ['bar.mod']

def test_modules():
    input = """
    module bar
    end
    """
    deps = string_dependencies(input, 'test.f90')
    assert deps.modules == set(['bar'])
    assert deps.products() == ['bar.mod']

def test_rules():
    input = """
    module foo
      use bar
    end module
    """
    deps = string_dependencies(input, 'test.f90')
    assert deps.rule() == 'test.o foo.mod : test.f90 bar.mod'
