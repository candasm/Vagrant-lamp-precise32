#!/usr/bin/env bash

cd /vagrant/provisions
systemLogRoot="/vagrant/.vagrant/log/provisions"


if [ -f "$systemLogRoot/systemSetup" ];
then
    echo "uninstalling system setup"
    apt-get autoremove -y build-essential python-software-properties curl vim git
    rm -rf "$systemLogRoot/systemSetup"
fi