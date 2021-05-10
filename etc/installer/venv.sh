#!/usr/bin/env bash

set -eu

PREFIX="${HOME}/.venv"
VENV_NAME="nvim-python3"

# use asdf
source "${HOME}/.asdf/asdf.sh"

# set up venv
mkdir -p "${PREFIX}"
python -m venv "${PREFIX}/${VENV_NAME}"

# install pynvim
source "${PREFIX}/${VENV_NAME}/bin/activate"
pip install pynvim
deactivate
