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

class File(object):
    """
    Represents a Fortran file
    """
    def __init__(self, filename, parent=None):
        self.filename  = filename
        self.parent    = parent
        self.modules   = []
        self.functions = []
        self.programs  = []

    def parse(self):
        """
        Populate the model by parsing `self.filename`
        """
        pass

