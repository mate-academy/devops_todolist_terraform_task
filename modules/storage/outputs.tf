output "install_app_url" {
  value = "${azurerm_storage_blob.install_app.url}${data.azurerm_storage_account_blob_container_sas.install_app.sas}"
  sensitive = true
}

output "storage_account_name" {
  value = azurerm_storage_account.example.name
}