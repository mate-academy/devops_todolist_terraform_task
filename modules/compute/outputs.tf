output "vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}

output "vm_id" {
  value = azurerm_linux_virtual_machine.vm.id
}

output "vm_public_ip" {
  value = var.public_ip_id
}

output "nic_id" {
  value = azurerm_network_interface.vm_nic.id
}