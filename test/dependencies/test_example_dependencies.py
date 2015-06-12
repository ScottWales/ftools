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

from ftools.dependencies import *
from textwrap import dedent

import os
here = os.path.dirname(__file__)
base = os.path.join(here,'../example_project')

def test_program():
    deps = file_dependencies('%s/program.f90'%base)
    expect = '{0}/program.o : {0}/program.f90 bar_mod.mod'.format(base)
    assert deps.rule() == expect
    assert deps.programs == set(['foo'])

def test_mod_bar():
    deps = file_dependencies('%s/bar_mod.f90'%base)
    expect = '{0}/bar_mod.o bar_mod.mod : {0}/bar_mod.f90 baz_mod.mod'.format(base)
    assert deps.rule() == expect

def test_mod_baz():
    deps = file_dependencies('%s/baz_mod.f90'%base)
    expect = '{0}/baz_mod.o baz_mod.mod : {0}/baz_mod.f90'.format(base)
    assert deps.rule() == expect

def test_directory():
    """
    Check dependency generation for the entire example project
    """
    deps = ProjectDependencies(base)
    expect = """
    {0}/bar_mod.o bar_mod.mod : {0}/bar_mod.f90 baz_mod.mod
    {0}/baz_mod.o baz_mod.mod : {0}/baz_mod.f90
    {0}/program.o : {0}/program.f90 bar_mod.mod
    foo : {0}/bar_mod.o {0}/baz_mod.o {0}/program.o
    """.format(base)
    # Can we get the objects that provide a module?
    assert deps.resolve_module_objects('baz_mod.mod') == [base+'/baz_mod.o']
    assert deps.resolve_module_objects('bar_mod.mod') == [base+'/baz_mod.o',base+'/bar_mod.o']

    # Can we get the objects that provide a program?
    assert base+'/program.o' in deps.resolve_object_links(base+'/program.o') 
    assert base+'/baz_mod.o' in deps.resolve_object_links(base+'/program.o') 
    assert base+'/bar_mod.o' in deps.resolve_object_links(base+'/program.o') 

    assert deps.rules() == dedent(expect).strip()

