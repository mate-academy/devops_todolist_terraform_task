# NIC
output "nic_id" {
  description = "ID of the Network Interface"
  value       = azurerm_network_interface.nic.id
}

output "nic_private_ip" {
  description = "Private IP address of the NIC"
  value       = azurerm_network_interface.nic.private_ip_address
}

# VM
output "vm_id" {
  description = "ID of the Virtual Machine"
  value       = azurerm_linux_virtual_machine.vm.id
}

# VM Extension
output "custom_script_extension_id" {
  description = "ID of the Custom Script VM Extension"
  value       = azurerm_virtual_machine_extension.custom_script.id
}
