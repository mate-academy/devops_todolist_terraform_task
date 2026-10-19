output "vm_name" {
  description = "Name of the virtual machine"
  value       = azurerm_linux_virtual_machine.vm.name
}

output "vm_id" {
  description = "Resource ID of the virtual machine"
  value       = azurerm_linux_virtual_machine.vm.id
}
