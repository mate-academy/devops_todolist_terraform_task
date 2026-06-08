resource "random_string" "storage_suffix" {
  length  = 8
  upper   = false
  special = false
  numeric = true
}

resource "azurerm_storage_account" "this" {
  name                     = "${var.storage_account_name_prefix}${random_string.storage_suffix.result}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "this" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "private"
}
