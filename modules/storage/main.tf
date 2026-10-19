resource "random_string" "storage" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_storage_account" "storage" {
  name                     = "${var.storage_account_name}${random_string.storage.result}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = "task-artifacts"
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "private"
}
