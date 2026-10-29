output "network_interface_id" {
  value = azurerm_network_interface.this.id
}

output "virtual_machine_id" {
  value = azurerm_linux_virtual_machine.this.id
}

output "virtual_machine_name" {
  value = azurerm_linux_virtual_machine.this.name
}
