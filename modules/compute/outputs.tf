output "network_interface_id" {
  value = azurerm_network_interface.main.id
}

output "virtual_machine_id" {
  value = azurerm_linux_virtual_machine.main.id
}

output "virtual_machine_extension_id" {
  value = azurerm_virtual_machine_extension.main.id
}