resource "azurerm_storage_account" "storage_acc" {
  name                     = var.storage_acc_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "storage_cont" {
  name                  = var.storage_cont_name
  storage_account_name  = azurerm_storage_account.storage_acc.name
  container_access_type = "private"
}