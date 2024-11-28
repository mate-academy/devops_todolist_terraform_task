output "virtual_network_id" {
  description = "The ID of the virtual network."
  value       = module.network.vnet_id
}

output "subnet_id" {
  description = "The ID of the subnet."
  value       = module.network.subnet_id
}

output "network_security_group_id" {
  description = "The ID of the network security group."
  value       = module.network.network_security_group_id
}

output "public_ip_address" {
  description = "The public IP address."
  value       = module.network.public_ip_address
}

output "virtual_machine_id" {
  description = "The ID of the virtual machine."
  value       = module.compute.virtual_machine_id
}

output "vm_extension_id" {
  description = "The ID of the VM extension."
  value       = module.compute.vm_extension_id
}

output "network_interface_id" {
  description = "The ID of the network interface."
  value       = module.compute.network_interface_id
}
