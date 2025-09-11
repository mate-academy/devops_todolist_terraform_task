resource "azurerm_virtual_network" "vnet" {
  name                = "vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags

}

resource "azurerm_subnet" "subnet" {
  name                 = "default"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0`/24"]
}

resource "azurerm_network_security_group" "nsg" {
  name                = "defaultnsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "random_integer" "dns_suffix" {
  min = 1000
  max = 9999
}

resource "azurerm_public_ip" "pip" {
  name                = "linuxboxpip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  sku                 = "Standard"
  domain_name_label   = "matetask${random_integer.dns_suffix.result}"
}