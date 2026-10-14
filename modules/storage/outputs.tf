output "storage_account_id" {
  value       = azurerm_storage_account.sa.id
  description = "The ID of the storage account"
}

output "storage_container_id" {
  value       = azurerm_storage_container.sc.id
  description = "The ID of the storage container"
}