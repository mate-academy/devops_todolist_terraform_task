output "nic" {
  value = azurerm_network_interface.main
}

output "vm" {
  value = azurerm_linux_virtual_machine.main
}
