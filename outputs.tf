output "vm_name" {
  value = module.compute.vm.name
}

output "public_ip" {
  value = module.network.public_ip.fqdn
}
