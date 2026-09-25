terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

resource "random_integer" "random" {
  min = 1000
  max = 9999
}

resource "azurerm_virtual_network" "this" {
  name                = "vnet"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "this" {
  name                 = "default"
  virtual_network_name = azurerm_virtual_network.this.name
  resource_group_name  = var.resource_group_name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_network_security_group" "this" {
  name                = "defaultnsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_public_ip" "this" {
  name                = "linuxboxpip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  domain_name_label   = "matetask${random_integer.random.result}"
}
resource "azurerm_subnet_network_security_group_association" "this" {
  subnet_id                 = azurerm_subnet.this.id
  network_security_group_id = azurerm_network_security_group.this.id
}