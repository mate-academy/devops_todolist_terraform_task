output "subnet_id" {
  description = "The ID of the subnet used for the virtual machine."
  value       = azurerm_subnet.default.id
}

output "public_ip_id" {
  description = "The ID of the Public IP address associated with the virtual machine."
  value       = azurerm_public_ip.linuxboxpip.id
}
