#!/usr/bin/env bash
set -euo pipefail

WORKING_DIRECTORY=${1}
cd ${WORKING_DIRECTORY}

export ARM_CLIENT_ID=${servicePrincipalId}
export ARM_CLIENT_SECRET=${servicePrincipalKey}
export ARM_SUBSCRIPTION_ID=$(az account show --query "id" -o tsv)
export ARM_TENANT_ID=${tenantId}

terraform plan \
  -input=false \
  -no-color \
  -out ${BUILD_BUILDNUMBER}.tfplan
