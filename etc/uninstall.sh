#!/bin/bash

set -eu

remove()
{
    echo "Removing ${1}"
    rm -rf "${2}"
}

remove "asdf" "${HOME}/.asdf"
remove "venv" "${HOME}/.venv"
