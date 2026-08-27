output "public_ip_address" {
  value       = module.network.public_ip
  description = "Public IP address of the virtual machine"
}
