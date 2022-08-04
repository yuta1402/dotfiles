#!/bin/bash

set -eu

hyperfine 'zsh -i -c exit' --show-output --warmup 3 --runs 10 -u millisecond --export-json bench.json > /dev/null
mean_time=$(cat bench.json | jq '.results[0].mean * 1000 | tostring')

cat<<EOF
[
    {
        "name": "zsh load time",
        "unit": "millisecond",
        "value": ${mean_time}
    }
]
EOF
