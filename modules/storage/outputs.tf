output "storage_account_name" {
  description = "The name of the created Storage Account."
  value       = azurerm_storage_account.sa.name
}

output "storage_container_name" {
  description = "The name of the storage container."
  value       = azurerm_storage_container.container.name
}

output "storage_account_primary_access_key" {
  description = "The primary access key for the Storage Account (required for VM Extension to access private blob)."
  value       = azurerm_storage_account.sa.primary_access_key
  sensitive   = true # Mark as sensitive, key should not be displayed in logs
}