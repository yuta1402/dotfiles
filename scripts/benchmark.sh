#!/bin/bash

set -eu

os=$(uname -s | tr '[A-Z]' '[a-z]')
case "${os}" in
    darwin)
        os='macOS'
        ;;
    linux)
        os='linux'
        ;;
    *)
esac

hyperfine 'zsh -i -c exit' --show-output --warmup 3 --runs 10 -u millisecond --export-json bench.json > /dev/null
mean_time=$(cat bench.json | jq '.results[0].mean * 1000 | tostring')

cat<<EOF
[
    {
        "name": "zsh load time (${os})",
        "unit": "millisecond",
        "value": ${mean_time}
    }
]
EOF
