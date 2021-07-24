#!/usr/bin/env bash


if [ -n "$SSH_USER" ] && [ -n "$SSH_PWD" ];then
    echo $SSH_USER:$SSH_PWD | chpasswd
fi;

