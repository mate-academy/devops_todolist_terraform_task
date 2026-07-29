output "public_ip_address" {
  description = "Public IP address of the VM. Visit http://<ip>:8080 to see the app."
  value       = module.network.public_ip_address
}

output "vm_name" {
  description = "Name of the created virtual machine"
  value       = module.compute.vm_name
}
