output "app_public_ip" {
  description = "Public IP address of app"
  value       = module.network.public_ip_address
}