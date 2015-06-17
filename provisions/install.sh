#!/usr/bin/env bash
sudo su
cd /vagrant/provisions/
systemLogRoot="/vagrant/.vagrant/log/provisions"

#scripts
if [ ! -f "$systemLogRoot/systemSetup" ];
then
    bash ./system.sh
    touch "$systemLogRoot/systemSetup"
fi

if [ ! -f "$systemLogRoot/apacheSetup" ];
then
    bash ./apache.sh
    touch "$systemLogRoot/apacheSetup"
fi