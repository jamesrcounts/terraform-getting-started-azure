#!/usr/bin/env bash
set -euo pipefail

WORKING_DIRECTORY=${1}
cd ${WORKING_DIRECTORY}

SUBSCRIPTION_ID=$(az account show --query "id" -o tsv)

terraform init \
  -input=false \
  -no-color \
  --backend-config="client_id=${servicePrincipalId}" \
  --backend-config="client_secret=${servicePrincipalKey}" \
  --backend-config="subscription_id=${SUBSCRIPTION_ID}" \
  --backend-config="tenant_id=${tenantId}"