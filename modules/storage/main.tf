resource "azurerm_storage_account" "example" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name

  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action             = "Deny"
    bypass                     = ["AzureServices"]
    virtual_network_subnet_ids = [var.subnet_id]
  }
}

resource "azurerm_storage_container" "example" {
  name                  = "task-artifacts"
  storage_account_id    = azurerm_storage_account.example.id
  container_access_type = "private"
}