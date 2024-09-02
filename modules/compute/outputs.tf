output "vm_nic_id" {
  value = azurerm_network_interface.vm_nic.id
}

output "vm_public_ip" {
  value = azurerm_public_ip.linuxboxpip.ip_address
}
