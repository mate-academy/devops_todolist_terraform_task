# Creates the storage account for application artifacts.
resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Creates the storage container for application artifacts.
resource "azurerm_storage_container" "sc" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "blob"
}

# Uploads the application installation script to the blob container.
resource "azurerm_storage_blob" "app_script" {
  name                   = "install-app.sh"
  storage_account_name   = azurerm_storage_account.sa.name
  storage_container_name = azurerm_storage_container.sc.name
  type                   = "Block"
  source                 = "${path.root}/install-app.sh"
}
