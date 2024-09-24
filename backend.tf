terraform {
  backend "azurerm" {
    storage_account_name = "shutftask12sa"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    resource_group_name  = "mate-azure-task-12"
  }
}
