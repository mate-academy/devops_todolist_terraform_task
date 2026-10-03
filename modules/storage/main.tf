resource "azurerm_storage_account" "storageaccount" {
  name                     = "matestgmelnyk"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "storagecontainer" {
  name                 = "task-artifacts"
  storage_account_name = azurerm_storage_account.storageaccount.name
}