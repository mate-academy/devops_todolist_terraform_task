terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.105.0"
    }
  }
}

resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "example" {
  name                  = var.storage_container_name
  storage_account_name = azurerm_storage_account.example.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "install_app" {
  name                   = "install-app.sh"
  storage_account_name   = azurerm_storage_account.example.name
  storage_container_name = azurerm_storage_container.example.name
  type                   = "Block"
  source                 = "${path.root}/install-app.sh"
}

data "azurerm_storage_account_blob_container_sas" "install_app" {
  connection_string = azurerm_storage_account.example.primary_connection_string
  container_name     = azurerm_storage_container.example.name
  https_only         = true

  start  = "2026-09-06T00:00:00Z"
  expiry = "2027-09-06T00:00:00Z"

  permissions {
    read   = true
    add    = false
    create = false
    write  = false
    delete = false
    list   = false
  }
}