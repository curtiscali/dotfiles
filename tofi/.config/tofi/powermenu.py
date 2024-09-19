import subprocess
import argparse
import os
import sys

def main(args):
    option_cmds = {    
        'Lock': '/home/cucali/.config/sway/scripts/lockman.sh',
        'Power Off': 'systemctl poweroff',
        'Restart': 'systemctl reboot',
        'Log Out': 'hyprctl dispatch exit',
        'Suspend': 'systemctl suspend',
        'Hibernate': 'systemctl hibernate'
    }

    options = sorted(option_cmds.keys())

    echo = subprocess.Popen(['echo', '\n'.join(options)], stdout=subprocess.PIPE)
    tofi = subprocess.Popen([
        'tofi', 
        '--config', '/home/cucali/.config/tofi/powermenu-config',
        '--anchor', 'top-right' if args.powermenu else 'center'
    ], stdin=echo.stdout, stdout=subprocess.PIPE, env=os.environ.copy())

    echo.stdout.close()
    wofi_output = tofi.communicate()[0].strip().decode('utf-8')

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
