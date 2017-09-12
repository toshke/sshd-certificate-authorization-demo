#!/usr/bin/env bash

set -e

# Workdir
cd /data

# Generate client key
keyname="client_root`date +%s`"
ssh-keygen -f $keyname -b 2048 -q -N ""
ssh-keygen -s users_ca -I root -n root -V +60s $keyname
chmod 600 $keyname-cert.pub

# Create local client configuration and add host key to known hosts
mkdir ~/.ssh
chmod 600 ~/.ssh
ssh-keyscan ssh_server >> ~/.ssh/known_hosts


while [ "1" == "1" ];do
  ssh -i $keyname root@ssh_server 'printf "\nServer container id = `hostname`\nServer time: `date`"'
  sleep 5
done
