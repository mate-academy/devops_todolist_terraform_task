output "vm_id" {
  value = azurerm_linux_virtual_machine.vm.id
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}

output "nic_id" {
  value = azurerm_network_interface.nic.id
}

output "nic_private_ip_address" {
  value = azurerm_network_interface.nic.private_ip_address
}