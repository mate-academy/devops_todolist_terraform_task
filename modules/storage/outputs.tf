output "storage_account_id" {
  description = "Storage account ID"
  value       = azurerm_storage_account.main.id
}

output "storage_account_name" {
  description = "Storage account name"
  value       = azurerm_storage_account.main.name
}

output "primary_blob_endpoint" {
  description = "Primary blob endpoint"
  value       = azurerm_storage_account.main.primary_blob_endpoint
}

output "task_artifacts_container_id" {
  description = "Task artifacts container ID"
  value       = azurerm_storage_container.task_artifacts.id
}

output "tfstate_container_id" {
  description = "Terraform state container ID"
  value       = azurerm_storage_container.tfstate.id
}
