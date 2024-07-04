import subprocess
import argparse
import os
import sys

WOFI_CENTER = 0
WOFI_TOP_RIGHT = 3

def main(args):
    option_cmds = {    
        'Lock': '/home/cucali/.config/sway/scripts/lockman.sh',
        'Power Off...': 'systemctl poweroff',
        'Restart...': 'systemctl reboot',
        'Log Out...': 'swaymsg exit',
        'Suspend': 'systemctl suspend',
        'Hibernate': 'systemctl hibernate'
    }

    location = WOFI_TOP_RIGHT if args.powermenu else WOFI_CENTER
    options = sorted(option_cmds.keys())

    echo = subprocess.Popen(['echo', '\n'.join(options)], stdout=subprocess.PIPE)
    wofi = subprocess.Popen([
        'wofi', 
        '--dmenu', 
        '--insensitive', 
        '--prompt', 'Power Menu',
        '--width', '300',
        '--style', '/home/cucali/.config/wofi/menu.css',
        '--lines', ('%s' % (len(options) + 2)),
        '--location', ('%s' % (location))
    ], stdin=echo.stdout, stdout=subprocess.PIPE, env=os.environ.copy())

    echo.stdout.close()
    wofi_output = wofi.communicate()[0].strip().decode('utf-8')

    if wofi_output != None and wofi_output != '':
        subprocess.run(option_cmds[wofi_output].split(), stdout=subprocess.PIPE)
        sys.stdout.flush()

if __name__ == '__main__':
    arg_parser = argparse.ArgumentParser()
    arg_parser.add_argument(
        '-p', 
        '--powermenu', 
        action='store_true',
        help='Whether this command is being called from the power button'
    )

    args = arg_parser.parse_args()
    main(args)
