resource "random_string" "st_name" {
  length  = 12
  special = false
  upper   = false
}

resource "azurerm_storage_account" "sa" {
  name                     = "sa${random_string.st_name.result}"
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = "task-artifacts"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}
