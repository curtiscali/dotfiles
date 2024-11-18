import subprocess
import argparse
import os
import sys
import re
import configparser

home_dir = os.path.expanduser('~')
config = configparser.ConfigParser()
config.read([home_dir + '/.config/fcitx5/profile'])

items_exp = re.compile('Groups/\\d/Items/\\d')

input_methods = []
for section in config.sections():
    if items_exp.match(section) != None:
        input_methods.append(config[section]['Name'])
