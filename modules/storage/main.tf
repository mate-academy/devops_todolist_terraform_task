terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.4.0"
    }
  }
}

resource "azurerm_storage_account" "sa" {
  name                     = var.sa_name
  resource_group_name      = var.resource_group_data.name
  location                 = var.resource_group_data.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_storage_container" "sc" {
  name                  = var.sc_name
  storage_account_id    = azurerm_storage_account.sa.id
  container_access_type = "private"
}
