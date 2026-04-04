# Day 40

#!/bin/bash

# We are creating 50GB root disk, but only 20GB is partitioned
# Remaining 30GB we need to extend using below commands
#!/bin/bash
set -e

# Disk + LVM
growpart /dev/nvme0n1 4
lvextend -r -L +30G /dev/mapper/RootVG-homeVol
xfs_growfs /home

# Install dependencies
yum install -y yum-utils

# Add HashiCorp repo
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

# Refresh repo cache
yum clean all
yum makecache

# Install Terraform
yum install -y terraform

# Verify installation
terraform -v