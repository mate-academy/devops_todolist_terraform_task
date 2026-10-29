output "vm_id" {
  value = azurerm_linux_virtual_machine.this.id
}

output "network_interface_id" {
  value = azurerm_network_interface.this.id
}

output "vm_private_ip" {
  value = azurerm_network_interface.this.private_ip_address
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.this.name
}
