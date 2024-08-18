output "comp_nic" {
  value = azurerm_network_interface.main
}

output "comp_vm" {
  value = azurerm_linux_virtual_machine.main
}
