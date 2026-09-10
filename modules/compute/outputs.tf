output "vm_id" {
  value       = azurerm_linux_virtual_machine.vm.id
  description = "The ID of the virtual machine"
}

output "vm_name" {
  value       = azurerm_linux_virtual_machine.vm.name
  description = "The name of the virtual machine"
}

output "network_interface_id" {
  value       = azurerm_network_interface.nic.id
  description = "The ID of the network interface"
}

output "private_ip_address" {
  value       = azurerm_network_interface.nic.private_ip_address
  description = "The private IP address of the virtual machine"
}
