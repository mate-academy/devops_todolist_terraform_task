output "vm_id" {
  description = "ID of the Linux virtual machine."
  value       = azurerm_linux_virtual_machine.matebox.id
}

output "nic_id" {
  description = "ID of the network interface."
  value       = azurerm_network_interface.main.id
}

output "public_ip_address" {
  description = "Public IP address assigned to the virtual machine."
  value       = azurerm_linux_virtual_machine.matebox.public_ip_address
}
