output "public_ip_address" {
  value = module.network.public_ip_address
}

output "public_ip_fqdn" {
  value = module.network.public_ip_fqdn
}

output "vm_id" {
  value = module.compute.vm_id
}
