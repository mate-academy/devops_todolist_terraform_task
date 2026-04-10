terraform {
  backend "azurerm" {
    resource_group_name  = "mate-azure-task-12"
    storage_account_name = "prydolobba"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
