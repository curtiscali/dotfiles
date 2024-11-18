import subprocess
import os
import configparser
import re
import sys

direction = sys.argv[1]

home_dir = os.path.expanduser('~')
config = configparser.ConfigParser()
config.read([home_dir + '/.config/fcitx5/profile'])

items_exp = re.compile('Groups/\\d/Items/\\d')

input_methods = []
for section in config.sections():
    if items_exp.match(section) != None:
        input_methods.append(config[section]['Name'])

current_ime_cmd = subprocess.run(['fcitx5-remote', '-n'], capture_output=True)
current_ime = current_ime_cmd.stdout.decode('utf-8').strip()

index_of_current = input_methods.index(current_ime)
next = (index_of_current + 1) % len(input_methods) if direction == '-u' else (index_of_current - 1) % len(input_methods)
subprocess.run(['fcitx5-remote', '-s', input_methods[next]], capture_output=True)
