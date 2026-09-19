terraform {
  backend "azurerm" {
    resource_group_name  = "mate-azure-task-12"
    storage_account_name = "petliukmatetask12sa"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
