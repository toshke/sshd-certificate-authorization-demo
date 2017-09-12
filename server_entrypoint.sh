#!/usr/bin/env bash

set -e
set -x

/usr/sbin/sshd -D -E /var/log/sshd &

tail -f /var/log/sshd
