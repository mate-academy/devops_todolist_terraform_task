output "vm_name" {
  description = "The name of the virtual machine."
  value       = azurerm_linux_virtual_machine.matebox.name
}

output "vm_id" {
  description = "The ID of the virtual machine."
  value       = azurerm_linux_virtual_machine.matebox.id
}

output "vm_private_ip" {
  description = "The private IP address of the virtual machine."
  value       = azurerm_network_interface.main.ip_configuration[0].private_ip_address
}

output "location" {
  description = "The location where the resources were created."
  value       = var.location
}
