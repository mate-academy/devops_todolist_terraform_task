output "storage_account_name" {
  description = "The name of the created storage account"
  value       = azurerm_storage_account.main.name

}

output "storage_container_name" {
  description = "The name of the created storage container"
  value       = azurerm_storage_container.main.name
}
