#!/bin/bash

# Day 40

# We are creating 50GB root disk, but only 20GB is partitioned
# Remaining 30GB we need to extend using below commands

# Need to use sudo access for bastion script to work 
sudo growpart /dev/nvme0n1 4
sudo lvextend -r -L +30G /dev/mapper/RootVG-homeVol
sudo xfs_growfs /home

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform