resource "azurerm_storage_account" "example" {
  name                     = "mate33"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "example" {
  name                  = "task-artifacts"
  storage_account_id    = azurerm_storage_account.example.id
  container_access_type = "private"
}