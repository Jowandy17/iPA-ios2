#!/bin/bash

# check if python is `python` or `python3`
if [ -x "$(command -v python3)" ]; then
    PYTHON=python3
elif [ -x "$(command -v python)" ]; then
    PYTHON=python
elif [ ! -x "$(command -v unzip)" ]; then
    echo "[!] unzip is not installed."
    exit 1
else
    echo "[!] couldn't find \"python\" nor \"python3\" installed."
    if [ "$(uname)" == "Linux" ]; then
        echo "[*] try \"sudo apt install python3 python3-pip\" or \"sudo pacman -S python python-pip\" depending on your distro."
    else
        echo "[*] for installation instructions, head over to python.org !"
    fi
    exit 1
fi

# check for pip
$PYTHON -m pip &> /dev/null
if [ $? -ne 0 ]; then
    echo "[!] pip check failed! are you sure you have pip installed?"
    exit 1
fi

echo "[*] installing required libraries.."
$PYTHON -m pip install requests Pillow > /dev/null

# create (or update) hidden dir
if [ ! -d ~/.chepe ] || [ $(ls -1 ~/.chepe | wc -l) -ne 8 ]; then
    echo "[*] downloading dependencies.."
    curl -so /tmp/chepe_dir.zip https://raw.githubusercontent.com/Jowandy17/iPA-ios2/main/chepe_dir.zip
    unzip -o /tmp/chepe_dir.zip -d ~/.chepe > /dev/null
fi

echo "[*] installing vape.."
sudo rm /usr/local/bin/vape &> /dev/null  # yeah this is totally required leave me alone
sudo curl -so /usr/local/bin/vape https://raw.githubusercontent.com/Jowandy17/iPA-ios2/main/vape.py
sudo sed -i "1s/.*/#!\/usr\/bin\/env $PYTHON/" /usr/local/bin/vape
echo "[*] fixed interpreter path!"
sudo chmod +x /usr/local/bin/vape
echo "[*] done!"
