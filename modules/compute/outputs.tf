output "public_ip_vm" {
  value       = azurerm_linux_virtual_machine.vm.public_ip_address
  description = "The public IP address of the virtual machine."
}