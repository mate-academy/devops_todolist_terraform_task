resource "azurerm_storage_account" "main" {
  name                     = "matestorageaccount1234"
  resource_group_name      = var.resource_group_name
  location                 = var.storage_location
  account_tier             = "Standard"
  account_replication_type = var.replication_type
}

resource "azurerm_storage_container" "container" {
  name                  = var.container_artifacts_name
  storage_account_id    = azurerm_storage_account.main.id
  container_access_type = "private"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.main.id
  container_access_type = "blob"
}
