#!/bin/bash

# Run Terraform to get the public IPs output
amazon_linux_ip=$(terraform output amzn_linux_ip)
ubuntu22_ip=$(terraform output ubuntu_linux_ip)

# Create an INI format dynamic inventory
inventory_content="[amazon_linux]\namzn_linux ansible_host=${amzn_linux_ip} ansible_user=amzn_linux\n\n"
inventory_content+="[ubuntu22]\nubuntu_linux ansible_host=${ubuntu_linux_ip} ansible_user=ubuntu_linux\n"

# Write the inventory to a file
echo -e "$inventory_content" > inventory.ini

echo "Dynamic inventory file generated: inventory.ini"
