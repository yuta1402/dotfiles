#!/bin/bash

PREFIX="${HOME}/.pyenv"
VERSION="3.9.5"
PYNVIM_ENV_NAME="nvim-python3"

# install pyenv
git clone https://github.com/pyenv/pyenv.git "${PREFIX}"
git clone https://github.com/yyuu/pyenv-virtualenv.git "${PREFIX}/plugins/pyenv-virtualenv"

# set up environment variables
export PYENV_ROOT="${PREFIX}"
export PATH="${PYENV_ROOT}/bin:${PATH}"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# set up virtualenv
pyenv install ${VERSION}
pyenv global ${VERSION}
pyenv virtualenv ${VERSION} ${PYNVIM_ENV_NAME}

# install pynvim
pyenv activate ${PYNVIM_ENV_NAME}
pip install pynvim
source deactivate
