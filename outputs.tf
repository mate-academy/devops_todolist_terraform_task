output "app_url" {
  description = "URL to open the ToDo List application in a browser"
  value       = "http://${module.network.public_ip_fqdn}:8080"
}

output "vm_name" {
  description = "Name of the deployed virtual machine"
  value       = module.compute.vm_name
}
