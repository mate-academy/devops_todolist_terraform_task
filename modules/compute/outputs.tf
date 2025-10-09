output "vm_public_ip" {
  description = "Public IP address of the VM"
  value       = module.network.public_ip_address
}

output "application_url" {
  description = "URL to access the ToDo List application"
  value       = "http://${module.network.public_ip_address}"
}

output "application_fqdn" {
  description = "FQDN to access the ToDo List application"
  value       = "http://${module.network.public_ip_fqdn}"
}

output "ssh_connection" {
  description = "SSH connection string"
  value       = "ssh azureuser@${module.network.public_ip_address}"
}