terraform {
  backend "azurerm" {
    resource_group_name  = "mate-azure-task-12"
    storage_account_name = "storageaccounttask12"
    container_name       = "task-artifacts"
    key                  = "terraform.tfstate"
  }
}

