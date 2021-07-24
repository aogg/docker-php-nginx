#!/usr/bin/env bash


echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config;

if [ -n X$SSH_USER ] && [ -n X$SSH_PWD ];then
    echo $SSH_USER:$SSH_PWD | chpasswd
fi;
