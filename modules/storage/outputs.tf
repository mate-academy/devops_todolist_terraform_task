output "script_url" {
  value       = "https://${azurerm_storage_account.storage.name}.blob.core.windows.net/task-artifacts/install-app.sh"
  description = "The URL of the install script in Azure Blob Storage."
}