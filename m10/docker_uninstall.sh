#!/bin/bash
sudo apt-get purge -y docker-ce docker-ce-cli containerd.io
sudo rm -rf /usr/bin/docker-compose
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
