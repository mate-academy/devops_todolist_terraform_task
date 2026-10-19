output "storage_account_name" {
  description = "Generated name of the storage account"
  value       = azurerm_storage_account.storage.name
}

output "storage_container_name" {
  description = "Name of the storage container"
  value       = azurerm_storage_container.container.name
}
