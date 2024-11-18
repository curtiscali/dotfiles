import subprocess

current_ime_cmd = subprocess.run(['fcitx5-remote', '-n'], capture_output=True)
current_ime = current_ime_cmd.stdout.decode('utf-8').strip()

if current_ime == 'keyboard-us':
    subprocess.run(['fcitx5-remote', '-s', 'pinyin'], capture_output=True)
elif current_ime == 'pinyin':
    subprocess.run(['fcitx5-remote', '-s', 'keyboard-us'], capture_output=True)
