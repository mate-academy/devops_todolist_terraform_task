terraform {
  backend "azurerm" {
    resource_group_name  = "mate-azure-task-12"                   # Can also be set via `ARM_USE_AZUREAD` environment variable.
    tenant_id            = "8d951a91-2b08-4f0b-8676-e68b358d5798" # Can be passed via `-backend-config=`"tenant_id=<tenant id>"` in the `init` command.
    storage_account_name = "yourstorageaccount"                   # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                              # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "terraform.tfstate"                    # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}
