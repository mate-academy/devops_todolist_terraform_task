terraform {
  backend "azurerm" {
    resource_group_name  = "mate-azure-task-12"
    storage_account_name = "teststoragea2c23"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}