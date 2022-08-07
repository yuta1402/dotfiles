#!/bin/bash

set -eu

usage()
{
    cat <<EOF
Usage:
    $(basename "${0}") <command> <name>
EOF
}

if [ $# -ne 2 ]; then
    usage
    exit 1
fi

command="${1}"
name="${2}"

# asdf
if [ -f "${HOME}/.asdf/asdf.sh" ]; then
    . $HOME/.asdf/asdf.sh
fi

hyperfine "${command}" --show-output --warmup 3 --runs 10 -u millisecond --export-json bench.json > /dev/null
mean_time=$(cat bench.json | jq '.results[0].mean * 1000 | tostring')

cat<<EOF
[
    {
        "name": "${name}",
        "unit": "millisecond",
        "value": ${mean_time}
    }
]
EOF
