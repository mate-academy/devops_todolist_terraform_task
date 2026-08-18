output "vm_name" {
  description = "Name of the virtual machine"
  value       = azurerm_linux_virtual_machine.main.name
}

output "vm_private_ip" {
  description = "Private IP address assigned to the VM's network interface"
  value       = azurerm_network_interface.main.private_ip_address
}