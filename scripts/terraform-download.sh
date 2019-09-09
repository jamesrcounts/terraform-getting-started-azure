#!/usr/bin/env bash
set -euo pipefail

curl -SL "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" --output terraform.zip
echo "${TERRAFORM_DOWNLOAD_SHA} terraform.zip" | sha256sum -c -
unzip "terraform.zip"
sudo mv terraform /usr/local/bin
terraform --version
rm terraform.zip