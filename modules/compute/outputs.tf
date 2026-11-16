output "vm_name" {
  value = azurerm_virtual_machine.main.name
}
output "vm_id" {
  value = azurerm_virtual_machine.main.id
}
output "network_interface_id" {
  value = azurerm_network_interface.main.id
}
output "public_ip_address_name" {
  value = var.public_ip_address_name
}
output "nic_id" {
  value = azurerm_network_interface.main.id
}


