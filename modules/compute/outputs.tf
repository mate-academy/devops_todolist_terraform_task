output "vm_id" {
  value = azurerm_linux_virtual_machine.vm.id
}

output "vm_public_ip" {
  value = var.public_ip_id
}
