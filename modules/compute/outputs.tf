output "virtual_machine_id" {
  description = "Virtual machine ID"
  value       = azurerm_virtual_machine.main.id
}

output "network_interface_id" {
  description = "Network interface ID"
  value       = azurerm_network_interface.main.id
}

output "network_interface_private_ip" {
  description = "Private IP address of the network interface"
  value       = azurerm_network_interface.main.private_ip_address
}

output "vm_name" {
  description = "Virtual machine name"
  value       = azurerm_virtual_machine.main.name
}
