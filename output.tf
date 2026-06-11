output "public_ip" {
  value       = module.network.public_ip_address
  description = "The public IP address of the virtual machine."
}