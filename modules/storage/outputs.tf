output "storage_account_name" {
  description = "Storage Account name"
  value       = azurerm_storage_account.storage.name
}

output "storage_container_name" {
  description = "name container"
  value       = azurerm_storage_container.container.name
}