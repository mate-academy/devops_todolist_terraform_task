resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  address_space       = [var.vn_address_prefix]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.sub_address_prefix]
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.virtual_security_group_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_public_ip" "pip" {
  name                = var.ip_address_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.dns_name}-${random_integer.suffix.result}"
}

resource "random_integer" "suffix" {
  min = 1000
  max = 9999
}