resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    project     = "vr89project"
    environment = "dev"
    owner       = "vr89"
  }
}

resource "azurerm_storage_container" "task_artifacts" {
  name                  = "task-artifacts"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"

  # Removed the unsupported tags argument from this resource.
}
