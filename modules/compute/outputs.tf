output "network_interface_name" {
  value = azurerm_network_interface.main.name
}

output "virtual_machine_name" {
  value = azurerm_linux_virtual_machine.example.name
}