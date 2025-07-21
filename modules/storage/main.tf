terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.37.0"
    }
  }
}

provider "azurerm" {
  features {}
}



resource "azurerm_storage_account" "msa-mate" {
  name                     = "msatodo"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}



resource "azurerm_storage_container" "msc-mate" {
  name                  = "task-artifacts"
  storage_account_id    = azurerm_storage_account.msa-mate.id
  container_access_type = "private"
}

resource "azurerm_storage_blob" "install_script" {
  name                   = "install-app.sh"
  storage_account_name   = azurerm_storage_account.msa-mate.name
  storage_container_name = azurerm_storage_container.msc-mate.name
  type                   = "Block"
  source                 = var.script_path           # локальний шлях до install-app.sh
}