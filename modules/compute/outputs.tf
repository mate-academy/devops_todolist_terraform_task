output "vm_id" {
  value = azurerm_linux_virtual_machine.vm.id
}

output "public_ip_id" {
  value = var.public_ip_id
}