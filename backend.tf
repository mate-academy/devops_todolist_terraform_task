terraform {
  backend "azurerm" {
    storage_account_name = "matestorageacc"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    resource_group_name  = "mate-azure-task-12"
  }
}
