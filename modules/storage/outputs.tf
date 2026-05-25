# The name of the Storage Account.
output "storage_account_name" {
  description = "The name of the Storage Account for application artifacts."
  value       = azurerm_storage_account.sa.name
}

# The name of the Storage Container.
output "storage_container_name" {
  description = "The name of the Storage Container for application artifacts."
  value       = azurerm_storage_container.sc.name
}

# The URL of the installation script in the blob storage.
output "script_url" {
  description = "The URL of the installation script for the VM extension."
  value       = azurerm_storage_blob.app_script.url
}
