resource "azurerm_storage_account" "example" {
  name                     = "hell4ccounttf22123"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "example" {
  name                  = var.storage_container_name
  storage_account_id    = azurerm_storage_account.example.id
  container_access_type = "private"
}