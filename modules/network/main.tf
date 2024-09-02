resource "azurerm_virtual_network" "vnet" {
  name                = "vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "default" {
  name                 = "default"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_network_security_group" "defaultnsg" {
  name                = "defaultnsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_public_ip" "linuxboxpip" {
  name                = "linuxboxpip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"

  # Changed from dns_settings to the correct domain_name_label argument.
  domain_name_label = "${var.dns_label_prefix}${random_integer.random.result}"
}

resource "random_integer" "random" {
  min = 1000
  max = 9999
}
