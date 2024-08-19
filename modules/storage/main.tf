resource "azurerm_storage_account" "main" {
  name                     = local.strg_acc_name
  resource_group_name      = var.strg_resource_group_name
  location                 = var.strg_location
  account_tier             = var.strg_account_tier
  access_tier              = (var.strg_account_access_tier != "" ? var.strg_account_access_tier : null)
  account_kind             = var.strg_account_kind
  account_replication_type = var.strg_account_replication_type
}

resource "azurerm_storage_container" "main" {
  name                  = var.strg_container_name
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = var.strg_container_access_type
}

resource "azurerm_storage_blob" "main" {
  name                   = var.strg_blob_name
  storage_account_name   = azurerm_storage_account.main.name
  storage_container_name = azurerm_storage_container.main.name
  type                   = var.strg_blob_type
  source                 = var.strg_blob_source
}
