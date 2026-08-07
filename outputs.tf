output "vm_fqdn" {
  description = "The FQDN of the Virtual Machine"
  value       = module.network.public_ip_fqdn
}