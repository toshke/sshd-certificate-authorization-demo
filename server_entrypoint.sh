#!/usr/bin/env bash

set -e
set -x

/usr/sbin/sshd -D -E /var/log/sshd &
# wait for server startup and log file existance
sleep 5
tail -f /var/log/sshd
