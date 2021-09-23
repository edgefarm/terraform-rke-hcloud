#!/bin/bash

sudo apt-get update && apt-get upgrade -y

# Installing and enabling fail2ban
sudo apt-get install -y fail2ban
sudo systemctl start fail2ban
sudo systemctl enable fail2ban

# Installing Docker
curl -sL https://releases.rancher.com/install-docker/20.10.sh | sh
sudo systemctl enable docker
sudo systemctl start docker
