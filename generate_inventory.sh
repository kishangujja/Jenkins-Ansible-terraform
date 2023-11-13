#!/bin/bash


frontend_ip=$(terraform output -json | grep amzn_linux | awk -F'"' '{print $4}')
backend_ip=$(terraform output -json | grep ubuntu_linux | awk -F'"' '{print $4}')

cat <<EOF
[frontend]
$frontend_ip

[backend]
$backend_ip
EOF
