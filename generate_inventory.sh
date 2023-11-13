#!/bin/bash

# Run Terraform to get the public IPs output
amzn_linux_ip=$(terraform output amzn_linux_public_ip)
ubuntu_linux_ip=$(terraform output ubuntu_linux_public_ip)

# Create an INI format dynamic inventory
inventory_content="[frontend]\n${amzn_linux_ip}"
inventory_content+="[backend]\n${ubuntu_linux_ip}"

# Write the inventory to a file
echo -e "$inventory_content" > inventory.ini

echo "Dynamic inventory file generated: inventory.ini"
