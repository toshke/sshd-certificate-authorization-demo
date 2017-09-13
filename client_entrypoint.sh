#!/usr/bin/env bash

set -e

# Workdir
cd /data

# Generate client key with 'root' as principal
keyname="client_root`date +%s`"
ssh-keygen -f $keyname -b 2048 -q -N ""
ssh-keygen -s users_ca -I root -n root -V +60s $keyname
chmod 600 $keyname-cert.pub

# Create local client configuration and add host key to known hosts
if [ ! -d "~/.ssh" ];then
  mkdir ~/.ssh
  chmod 600 ~/.ssh
fi
ssh-keyscan ssh_server >> ~/.ssh/known_hosts

# Print out hostname and server time as long as certificate is valid
# as -e is used on bash script, container will stop first time
# non 0 status is returned from command
while [ "1" == "1" ];do
  ssh -i $keyname root@ssh_server 'printf "\nServer container id = `hostname`\nServer time: `date`"'
  sleep 5
done
