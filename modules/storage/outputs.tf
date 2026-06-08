output "storage_account_name" {
  value = azurerm_storage_account.this.name
}

output "storage_container_name" {
  value = azurerm_storage_container.this.name
}

output "storage_account_primary_blob_endpoint" {
  value = azurerm_storage_account.this.primary_blob_endpoint
}
