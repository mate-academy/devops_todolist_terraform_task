output "subnet-id" {
    value = azurerm_subnet.sn.id
}
output "pip-id" {
    value = azurerm_public_ip.pip.id
}