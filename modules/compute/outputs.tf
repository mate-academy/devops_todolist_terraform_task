output "nic_id" {
  value = azurerm_network_interface.this.id
}

output "vm_id" {
  value = azurerm_linux_virtual_machine.this.id
}

output "ssh_key_id" {
  value = azurerm_ssh_public_key.linuxboxsshkey.id
}
