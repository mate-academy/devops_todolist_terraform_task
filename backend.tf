terraform {
  backend "azurerm" {
    resource_group_name  = "mate-azure-task-12"
    storage_account_name = "mateterraformstate1234567890"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}