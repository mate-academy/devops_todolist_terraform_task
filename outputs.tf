output "network_vnet_id" {
  value = module.network.vnet_id
}

output "network_subnet_id" {
  value = module.network.subnet_id
}

output "network_nsg_id" {
  value = module.network.nsg_id
}

output "network_pip_id" {
  value = module.network.pip_id
}

output "blob_url" {
  value = module.storage.blob_url
}

output "vm_ip" {
  description = "The public IP address of the virtual machine"
  value       = module.network.public_ip_address
}