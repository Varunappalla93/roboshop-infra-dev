# Day 40

#!/bin/bash

# We are creating 50GB root disk, but only 20GB is partitioned
set -e

# Disk extension
growpart /dev/nvme0n1 4
lvextend -r -L +30G /dev/mapper/RootVG-homeVol

# Install Terraform (manual - guaranteed)
cd /tmp

curl -LO https://releases.hashicorp.com/terraform/1.7.5/terraform_1.7.5_linux_amd64.zip

yum install -y unzip

unzip -o terraform_1.7.5_linux_amd64.zip

mv terraform /usr/local/bin/
chmod +x /usr/local/bin/terraform

# Verify
terraform -v