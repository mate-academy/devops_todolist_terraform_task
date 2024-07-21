resource "azurerm_storage_account" "storage" {
  name                     = "storageippk"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = "task-artifacts"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}