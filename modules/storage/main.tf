resource "random_string" "suffix" {
  length  = 8
  upper   = false
  numeric = true
  special = false
}

resource "azurerm_storage_account" "this" {
  name                = "taskstorage${random_string.suffix.result}"
  resource_group_name = var.resource_group_name
  location            = var.location

  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}

resource "azurerm_storage_container" "artifacts" {
  name                  = "task-artifacts"
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "private"
}
