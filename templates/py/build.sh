#!/bin/bash

set -euxo pipefail

cat ~/.gitconfig

# make a venv
if [[ ! -e venv ]]; then
    $(which python3) -m venv ./venv
    . venv/bin/activate
    pip install -r requirements.txt
else
    . venv/bin/activate
fi

python3 -m pytest .