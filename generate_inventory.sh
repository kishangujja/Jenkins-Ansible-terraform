#!/bin/bash

# Retrieve public IPs from Terraform output without using jq
frontend_ip=$(terraform output -json | grep -oP '"amzn_linux":\s*\{\s*"public_ip": "\K[^"]+')
backend_ip=$(terraform output -json | grep -oP '"ubuntu_linux":\s*\{\s*"public_ip": "\K[^"]+')

cat <<EOF
[frontend]
$frontend_ip

[backend]
$backend_ip
EOF

