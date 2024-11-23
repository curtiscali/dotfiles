import subprocess
import os
import sys
import re
import configparser

ime_labels = {
    'English (US)': 'keyboard-us',
    'Simplified Chinese (简体中文)': 'pinyin'
}

home_dir = os.path.expanduser('~')
config = configparser.ConfigParser()
config.read([home_dir + '/.config/fcitx5/profile'])

items_exp = re.compile('Groups/\\d/Items/\\d')

input_methods = []
for section in config.sections():
    if items_exp.match(section) != None:
        input_methods.append(config[section]['Name'])

echo = subprocess.Popen(['echo', '\n'.join(ime_labels.keys())], stdout=subprocess.PIPE)
tofi = subprocess.Popen([
    'tofi', 
    '--anchor', 'center'
], stdin=echo.stdout, stdout=subprocess.PIPE, env=os.environ.copy())

echo.stdout.close()
wofi_output = tofi.communicate()[0].strip().decode('utf-8')

if wofi_output != None and wofi_output != '':
    command = 'fcitx5-remote -s ' + ime_labels[wofi_output]
    subprocess.run(command.split(), stdout=subprocess.PIPE)
    sys.stdout.flush()
