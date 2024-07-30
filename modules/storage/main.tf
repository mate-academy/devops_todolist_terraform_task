resource "azurerm_storage_account" "storage" {
  name                     = "ikstacc"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "todoapp_blob" {
  name                   = "install-app.sh"
  storage_account_name   = azurerm_storage_account.storage.name
  storage_container_name = azurerm_storage_container.container.name
  type                   = "Block"
  source                 = var.source_file_path
}

output "blob_url" {
  value = azurerm_storage_blob.todoapp_blob.url
}
