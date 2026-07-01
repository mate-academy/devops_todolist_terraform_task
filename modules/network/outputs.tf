output "subnet_id" {
  description = "ID of the subnet (used by the network interface in the compute module)"
  value       = azurerm_subnet.subnet.id
}

output "public_ip_id" {
  description = "ID of the public IP (attached to the network interface in the compute module)"
  value       = azurerm_public_ip.pip.id
}

output "public_ip_fqdn" {
  description = "Full DNS name of the public IP (used to open the app in a browser)"
  value       = azurerm_public_ip.pip.fqdn
}
