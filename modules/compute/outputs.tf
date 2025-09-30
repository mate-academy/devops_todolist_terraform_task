output "network_interface_id" {
  description = "ID of the network interface"
  value       = azurerm_network_interface.nic.id
}

output "vm_id" {
  description = "ID of the Linux VM"
  value       = azurerm_linux_virtual_machine.matebox.id
}

output "vm_name" {
  description = "Name of the Linux VM"
  value       = azurerm_linux_virtual_machine.matebox.name
}