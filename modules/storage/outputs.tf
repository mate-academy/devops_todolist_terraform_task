output "storage_account_primary_key" {
  value       = azurerm_storage_account.storage_account.primary_access_key
  description = "The primary access key of the storage account, used for authentication in other resources."
}
