resource "azurerm_storage_account" "storage_admin_password" {
  account_replication_type = "LRS"
  account_tier             = "Standard"
  location                 = var.resource-location
  name                     = "matestorageaccnt"
  resource_group_name      = var.resource-group-name
}

resource "azurerm_storage_container" "task-artifacts" {
  name                  = "task-artifacts"
  container_access_type = "private"
}