resource "random_id" "storage_suffix" {
  byte_length = 4
}

resource "azurerm_storage_account" "st_acc" {
  name                     = "matetask${random_id.storage_suffix.hex}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "task_artifacts" {
  name                  = "task-artifacts"
  storage_account_name  = azurerm_storage_account.st_acc.name
  container_access_type = "private"
}