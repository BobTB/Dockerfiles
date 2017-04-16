#!/bin/sh

if [ $# -eq 0 ]; then
    exec ./cachet-monitor -c config.json
else
    exec $@
fi
