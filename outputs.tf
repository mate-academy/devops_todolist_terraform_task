output "public_ip_fqdn" {
  description = "FQDN of the Linux VM"
  value       = module.network.fqdn
}

output "vm_id" {
  description = "ID of the Virtual Machine"
  value       = module.compute.vm_id
}