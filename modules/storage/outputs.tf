output "storage_account_name" {
  description = "Name of the storage account."
  value       = azurerm_storage_account.main.name
}

output "storage_container_name" {
  description = "Name of the storage container."
  value       = azurerm_storage_container.task_artifacts.name
}

output "storage_account_id" {
  description = "ID of the storage account."
  value       = azurerm_storage_account.main.id
}
