resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  address_space       = [var.vnet_address_prefix]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "default" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_address_prefix]
}

resource "azurerm_network_security_group" "defaultnsg" {
  name                = var.network_security_group_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_public_ip" "linuxboxpip" {
  name                = var.public_ip_address_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.dns_label}${random_integer.random.result}"
}

resource "random_integer" "random" {
  min = 10000
  max = 99999
}
