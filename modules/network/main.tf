resource "azurerm_virtual_network" "this" {
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group_name

  address_space = [var.vnet_address_prefix]
  tags          = var.tags
}

resource "azurerm_subnet" "default" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name

  address_prefixes = [var.subnet_address_prefix]
}

resource "azurerm_network_security_group" "default" {
  name                = var.network_security_group_name
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "default" {
  subnet_id                 = azurerm_subnet.default.id
  network_security_group_id = azurerm_network_security_group.default.id
}

resource "random_integer" "dns" {
  min = 1000
  max = 9999
}

locals {
  dns_label = lower(format("%s%d", var.dns_label, random_integer.dns.result))
}

resource "azurerm_public_ip" "linuxbox" {
  name                = var.public_ip_address_name
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = "Dynamic"
  domain_name_label = local.dns_label

  tags = var.tags
}
