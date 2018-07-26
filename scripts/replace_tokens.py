#!/usr/bin/env python

"""
Program to replace tokens with values. Usage:

    python filter.py <CONFIG_FILE> <INPUT_FILE> <OUTPUT_FILE>

where:

* <CONFIG_FILE>: a YAML file with keys and values only. Values
  must  be strings, integers, floats or booleans only.
* <INPUT_FILE>: a plain-text file.
* <OUTPUT_FILE>: <INPUT_FILE> with all occurrences of tokens
  replaced by values.

For every key, TOKEN, in <CONFIG_FILE>, if %TOKEN% is found in
<INPUT_FILE> it is replaced with the value corresponding to
the key.

Any occurrences of a special token "%DATE%" are replaced with
the current date in form, for example, "23 July 2018".
"""

# Copyright (c) 2018 The University of Edinburgh
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import datetime
import re
import sys
import yaml


PATTERN = re.compile("%.*?%")


def load_tokens(token_file):
    """
    Load keys and values from YAML file, token_file.

    Values must be strings, integers, floats or booleans only.

    For every TOKEN:VALUE in file, a key-value pair,
    %TOKEN%,VALUE, is added to a dict that is returned.

    A special key-value pair, %DATE%,<CURRENT-DATE> is also added,
    where the current date is of form, for example, "23 July 2018".

    :param token_file: file name
    :type token_file: str or unicode
    :return: tokens and values
    :rtype: dict
    """
    with open(token_file, "r") as f:
        user_tokens = yaml.load(f)
    tokens = {}
    for (key, value) in list(user_tokens.items()):
        tokens["%%%s%%" % key] = value
    tokens["%DATE%"] = datetime.datetime.now().strftime("%d %B %Y")
    return tokens


def replace_tokens_in_string(tokens, string):
    """
    Replace tokens with values in a string.

    For every occurrence of a string of form %...%, look for a
    corresponding token in tokens. If present, replace the string with
    the corresponding value.

    :param tokens: tokens and values
    :rtype tokens: dict
    :param string: string
    :type str: str or unicode
    :return: string with tokens replaced by values
    :trype: str or unicode
    """
    matches = re.findall(PATTERN, string)
    for match in matches:
        if match in tokens:
            # Convert to str in case value is a number
            string = string.replace(match, str(tokens[match]))
    return string


def replace_tokens(tokens, src, dst):
    """
    Read an input file, replace tokens with values, write the
    updated file.

    Read src and for every occurrence of a string of form %...%,
    look for a corresponding token in tokens. If present, replace
    the string with the corresponding value. Write the updated
    content to dst.

    :param tokens: tokens and values
    :rtype tokens: dict
    :param src: input file name
    :type src: str or unicode
    :param src: output file name
    :type src: str or unicode
    """
    filtered = []
    with open(src, "r") as f:
        lines = f.readlines()
    for line in lines:
        line = replace_tokens_in_string(tokens, line)
        filtered.append(line)
    with open(dst, "w") as f:
        for line in filtered:
            f.write(line)


if __name__ == "__main__":
    tokens = load_tokens(sys.argv[1])
    replace_tokens(tokens, sys.argv[2], sys.argv[3])
