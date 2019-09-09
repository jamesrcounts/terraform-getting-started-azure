#!/usr/bin/env bash
set -euo pipefail

terraform init \
  -input=false \
  -no-color \
  --backend-config="client_id=${AZURE_CLIENT_ID}" \
  --backend-config="client_secret=${AZURE_CLIENT_SECRET}" \
  --backend-config="subscription_id=${AZURE_SUBSCRIPTION_ID}" \
  --backend-config="tenant_id=${AZURE_TENANT_ID}"