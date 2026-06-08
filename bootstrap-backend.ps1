param(
    [string]$ResourceGroupName = "mate-azure-task-12",
    [string]$Location = "uksouth"
)

$ErrorActionPreference = "Stop"

Write-Host "Checking Azure CLI login..."
az account show 1>$null

Write-Host "Ensuring resource group '$ResourceGroupName' exists..."
az group create --name $ResourceGroupName --location $Location 1>$null

Write-Host "Initializing Terraform backend..."
terraform init -reconfigure -backend-config="resource_group_name=$ResourceGroupName"
if ($LASTEXITCODE -ne 0) {
    throw "terraform init failed. Verify backend storage_account_name/container_name in backend.tf and ensure the storage account exists in the specified resource group."
}

Write-Host "Backend bootstrap completed."
