#!/bin/bash
# One-off bootstrap: creates the resource group + storage account + container
# that Terraform's azurerm backend (backend.tf) needs to store remote state.
# Run this once, before the first `terraform init`, with `az login` already done.
set -euo pipefail

RESOURCE_GROUP_NAME="${RESOURCE_GROUP_NAME:-mate-azure-task-12}"
LOCATION="${LOCATION:-uksouth}"
CONTAINER_NAME="${CONTAINER_NAME:-tfstate}"
STORAGE_ACCOUNT_NAME="${STORAGE_ACCOUNT_NAME:-tfstate$(openssl rand -hex 4)}"

echo "Resource group:  $RESOURCE_GROUP_NAME ($LOCATION)"
echo "Storage account: $STORAGE_ACCOUNT_NAME"
echo "Container:       $CONTAINER_NAME"
echo

az group create \
  --name "$RESOURCE_GROUP_NAME" \
  --location "$LOCATION" \
  --output none

az storage account create \
  --name "$STORAGE_ACCOUNT_NAME" \
  --resource-group "$RESOURCE_GROUP_NAME" \
  --location "$LOCATION" \
  --sku Standard_LRS \
  --encryption-services blob \
  --min-tls-version TLS1_2 \
  --output none

az storage container create \
  --name "$CONTAINER_NAME" \
  --account-name "$STORAGE_ACCOUNT_NAME" \
  --auth-mode login \
  --output none

cat <<EOF

Done. Update backend.tf with:

  resource_group_name  = "$RESOURCE_GROUP_NAME"
  storage_account_name = "$STORAGE_ACCOUNT_NAME"
  container_name        = "$CONTAINER_NAME"
  key                    = "terraform.tfstate"
EOF
