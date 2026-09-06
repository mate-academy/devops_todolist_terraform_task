output "vm_id" {
  value = module.compute.vm_id
}

output "network_interface_id" {
  value = module.compute.network_interface_id
}

output "public_ip_address" {
  value = module.network.public_ip_address
}