output "vm_id" {
  value       = azurerm_linux_virtual_machine.main.id
  description = "The ID of the virtual machine."
}

# Corrected the value to get the private IP from the IP configuration.
output "vm_private_ip" {
  value       = azurerm_network_interface.main.ip_configuration[0].private_ip_address
  description = "The private IP address of the virtual machine."
}

# Added public IP output for easier verification.
output "vm_public_ip" {
  value       = azurerm_network_interface.main.ip_configuration[0].public_ip_address_id != null ? data.azurerm_public_ip.vm_pip.ip_address : ""
  description = "The public IP address of the virtual machine."
}

data "azurerm_public_ip" "vm_pip" {
  name                = split("/", azurerm_network_interface.main.ip_configuration[0].public_ip_address_id)[8]
  resource_group_name = var.resource_group_name
  depends_on          = [azurerm_linux_virtual_machine.main]
}
