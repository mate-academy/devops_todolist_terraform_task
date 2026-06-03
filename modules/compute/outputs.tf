output "vm_id" {
  value = azurerm_linux_virtual_machine.todo_vm.id
}

output "ssh_public_key" {
  value = azurerm_ssh_public_key.name.public_key
}

output "nic_id" {
  value = azurerm_network_interface.nic.id
}

output "vm_extension_id" {
  value = azurerm_virtual_machine_extension.name.id
}