terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.4.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.9.0"
    }

  }
}

resource "random_integer" "dns_suffix" {
  min = 1000
  max = 9999
}

resource "azurerm_virtual_network" "virtual_network" {
  name                = var.virtual_network_name
  address_space       = [var.vnet_address_prefix]
  location            = var.resource_group_data.location
  resource_group_name = var.resource_group_data.name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_data.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = [var.subnet_address_prefix]
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.network_security_group_name
  location            = var.resource_group_data.location
  resource_group_name = var.resource_group_data.name

  dynamic "security_rule" {
    for_each = var.security_rules
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }
}

resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_address_name
  resource_group_name = var.resource_group_data.name
  location            = var.resource_group_data.location
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.dns_label}-${random_integer.dns_suffix.result}"

}

resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
