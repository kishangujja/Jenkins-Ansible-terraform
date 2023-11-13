#!/bin/bash

frontend_ip=$(terraform output -json | jq -r '.amzn_linux.value.public_ip')
backend_ip=$(terraform output -json | jq -r '.ubuntu_linux.value.public_ip')

cat <<EOF
[frontend]
$frontend_ip

[backend]
$backend_ip
EOF
