output "public_ip_address" {
  description = "The public IP address assigned to the virtual machine"
  value       = module.network.public_ip_address
}

output "public_ip_fqdn" {
  description = "The fully qualified domain name (FQDN) of the public IP address"
  value       = module.network.public_ip_fqdn
}