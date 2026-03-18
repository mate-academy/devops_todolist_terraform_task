resource "azurerm_storage_account" "storage_account" {
  name = "matetaststorageaccount"

  account_replication_type = "GRS"
  account_tier             = "Standard"

  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_storage_container" "task_artifacts" {
  name               = "task-artifacts"
  storage_account_id = azurerm_storage_account.storage_account.id
}
