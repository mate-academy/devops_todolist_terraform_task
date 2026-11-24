output "vm_id" {
  description = "ID of the virtual machine"
  value       = azurerm_linux_virtual_machine.vm.id
}

output "network_interface_id" {
  description = "ID of the network interface"
  value       = azurerm_network_interface.nic.id
}
