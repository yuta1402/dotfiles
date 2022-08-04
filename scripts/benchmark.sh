#!/bin/zsh

set -eu

echo $SHELL

TIMEFMT='%mE';

# warm up
(time zsh -i -c exit 1) >/dev/null 2>&1

total_millisec=0
for i in $(seq 1 10); do
    millisec=$((time zsh -i -c exit) 2>/dev/stdout >/dev/null)
    millisec=$(echo ${millisec} | tr -d 'ms')
    total_millisec=$((${total_millisec} + ${millisec}))
done
average_millisec=$((${total_millisec} / 10))

cat<<EOF
[
    {
        "name": "zsh load time",
        "unit": "millisecond",
        "value": ${average_millisec}
    }
]
EOF
