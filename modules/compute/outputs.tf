output "nic_id" {
  value = azurerm_network_interface.nic.id
}

output "vm_id" {
  description = "ID of the VM"
  value       = azurerm_linux_virtual_machine.vm.id
}

