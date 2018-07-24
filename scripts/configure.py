#!/usr/bin/env python

"""
Filter to replace tokens with values. This filter expects to
find a PANDOC_CONFIG environment variable with the location a YAML
file which contains tokens and the values to replace these.

If a token of form %TOKEN% is found in a document being processed by
Pandoc, then TOKEN is sought in the tokens. If found then the token is
replace by its value.

A special token "%DATE%" is replaced with today's date in form, for
example, "23 July 2018".
"""


import datetime
import os
import re
import sys
import yaml


PATTERN = re.compile("%.*?%")


def load_config(config_file):
    with open(config_file, "r") as f:
        user_config = yaml.load(f)
    config = {}
    for (key, value) in user_config.iteritems():
        config["%%%s%%" % key] = value
    config["%DATE%"] = datetime.datetime.now().strftime("%d %B %Y")
    return config


def preconfig(config, src, dst):
    filtered = []
    with open(src, "r") as f:
        lines = f.readlines()
    for line in lines:
        matches = re.findall(PATTERN, line)
        for match in matches:
            if match in config:
                # Convert to str in case value is a number
                line = line.replace(match, str(config[match]))
        filtered.append(line)
    with open(dst, "w") as f:
        for line in filtered:
            f.write(line)


if __name__ == "__main__":
    config = load_config(sys.argv[1])
    preconfig(config, sys.argv[2], sys.argv[3])
