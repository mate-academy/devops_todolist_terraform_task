# 1. Storage Account (must have a globally unique name)
resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS" # Local Redundancy (Cost-effective)
}

# 2. Storage Container (task-artifacts)
resource "azurerm_storage_container" "container" {
  name                  = var.storage_container_name # task-artifacts
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "blob"
}