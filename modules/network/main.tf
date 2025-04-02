

resource "azurerm_virtual_network" "vn" {
  name                = var.virtual-network-name
  address_space       = [var.vnet_address_prefix]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "sn" {
  name                 = var.subnet-name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vn.name
  address_prefixes     = [var.subnet_address_prefix]
}

resource "azurerm_public_ip" "pip" {
  name                = var.pip-name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  domain_name_label = var.dns_label
}
resource "azurerm_network_security_group" "nsg" {
  name                = var.network-security-group-name
  location            = var.location
  resource_group_name = var.resource_group_name
}
