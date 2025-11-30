# outputs.tf (Root file)

# Outputs the actual public IP address of the VM
output "public_ip_address" {
  description = "The public IP address of the Linux VM."
  value       = module.network.public_ip_address
}

# Outputs the full URL for accessing the application
output "application_url" {
  description = "The fully qualified domain name (FQDN) to access the ToDo List application."
  value       = "http://${module.network.public_ip_fqdn}"
}

# Outputs the SSH command for easy connection (Step 9)
output "vm_ssh_connection" {
  description = "The SSH command to connect to the VM."
  value       = "ssh ${var.admin_username}@${module.network.public_ip_fqdn}"
}