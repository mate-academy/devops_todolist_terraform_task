terraform {
  backend "azurerm" {
    resource_group_name  = "mate-azure-task-12"
    storage_account_name = "ihor1231233b"
    container_name        = "tfstate"
    key                    = "terraform.tfstate"
  }
}