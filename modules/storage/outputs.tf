output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}

output "storage_container_name" {
  value = azurerm_storage_container.task_artifacts.name
}

output "storage_account_primary_access_key" {
  value = azurerm_storage_account.storage.primary_access_key
}

output "storage_account_connection_string" {
  value = azurerm_storage_account.storage.primary_connection_string
}
