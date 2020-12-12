#!/bin/bash

set -euo pipefail

# make a venv
if [[ ! -e venv ]]; then
    python3 -m venv venv
    . venv/bin/activate
    pip install -r requirements.txt
else
    . venv/bin/activate
fi

python3 -m pytest .