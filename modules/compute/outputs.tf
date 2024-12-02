output "network_interface_id" {
  description = "The ID of the network interface."
  value       = azurerm_network_interface.vm-nic.id
}

output "virtual_machine_id" {
  description = "The ID of the virtual machine."
  value       = azurerm_linux_virtual_machine.matebox.id
}

output "vm_extension_id" {
  description = "The ID of the VM extension."
  value       = azurerm_virtual_machine_extension.CustomScript.id
}

