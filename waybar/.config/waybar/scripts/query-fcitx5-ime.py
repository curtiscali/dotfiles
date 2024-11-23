import subprocess
import time
import json

ime_labels = {
    'keyboard-us': 'EN',
    'pinyin': '中'
}

while True:
    current_ime_cmd = subprocess.run(['fcitx5-remote', '-n'], capture_output=True)
    current_ime = current_ime_cmd.stdout.decode('utf-8').strip()

    output_data = { 'text': f'{ime_labels[current_ime]}' }
    print(json.dumps(output_data), flush=True)

    time.sleep(0.2)
