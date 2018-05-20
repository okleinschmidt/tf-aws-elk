#!/bin/bash
sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
sudo cp -r /tmp/yum.repos.d /etc/
sudo yum -y -q update
sudo yum -y -q upgrade
sudo yum -y -q install java-1.8.0-openjdk.x86_64
sudo yum -y -q remove java-1.7.0-openjdk
sudo yum -y -q install logstash
sudo cp -r /tmp/logstash /etc/
sudo rm -rf /tmp/yum.repos.d /tmp/logstash
sudo /usr/share/logstash/bin/system-install
sudo initctl start logstash
