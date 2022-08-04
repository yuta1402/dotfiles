#!/bin/bash

set -eu

hyperfine 'zsh -i -c exit' --show-output --warmup 3 --runs 10 -u millisecond --export-json result.json > /dev/null
mean_time=$(cat result.json | jq '.results[0].mean * 1000 | tostring')

cat<<EOF
[
    {
        "name": "zsh load time",
        "unit": "millisecond",
        "value": ${mean_time}
    }
]
EOF
