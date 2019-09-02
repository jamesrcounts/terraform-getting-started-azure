#!/usr/bin/env bash

set -euo pipefail

ID=$(uuidgen)
LOCATION=westus
RG=terraformrg

# Create unique name for storage account
STORAGE_ACCOUNT=$(echo "terraform-${ID}" | tr '[:upper:]' '[:lower:]' | sed 's/-//g' | cut -c1-24)

# Create Resource Group for Backend Storage
az group create \
  --location ${LOCATION} \
  --name ${RG}

# Create Geo-Redundant Storage Account
az storage account create \
  --kind StorageV2 \
  --location ${LOCATION} \
  --name "${STORAGE_ACCOUNT}" \
  --resource-group ${RG}  \
  --sku Standard_GRS

# Enable blob soft-deletes
az storage blob service-properties delete-policy update \
  --account-name "${STORAGE_ACCOUNT}" \
  --days-retained 365 \
  --enable true

# Create storage container
az storage container create \
  --account-name "${STORAGE_ACCOUNT}" \
  --name terraform