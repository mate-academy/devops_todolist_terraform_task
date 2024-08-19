terraform {
  backend "azurerm" {
    resource_group_name  = "mate-resources"
    storage_account_name = "matest0rage"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
