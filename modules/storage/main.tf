resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}

resource "azurerm_storage_account" "storage" {
  account_replication_type = "LRS"
  account_tier             = "Standard"
  location                 = var.location
  name                     = "matestorageaccnt${random_string.suffix.result}"
  resource_group_name      = var.resource_group_name
}

resource "azurerm_storage_container" "task_artifacts" {
  name                  = "task-artifacts"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}