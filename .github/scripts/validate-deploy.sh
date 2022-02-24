#!/usr/bin/env bash
SCRIPT_DIR=$(cd $(dirname "$0"); pwd -P)
echo "SCRIPT_DIR: ${SCRIPT_DIR}"

terraform output -json instance_public_ip > ip.txt

grep -o '".*"' ip.txt | sed 's/"//g' > publicip.txt

PUBLIC_IP=$(cat publicip.txt)

echo "Private key"
cat swe-pri-key

echo "Connecting to ssh server: ${PUBLIC_IP}"

ssh -o "StrictHostKeyChecking no" -i swe-pri-key ec2-user@${PUBLIC_IP} ls

exit 0
