terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.9.1"
    }
  }
}

resource "random_integer" "dns_label" {
  min = 1
  max = 500
}

resource "azurerm_network_security_group" "portfolio" {
  name                = var.network_security_group_name
  location            = var.location
  resource_group_name = var.resource_group_name

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

resource "azurerm_virtual_network" "portfolio" {
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.vnet_address_prefix]
  dns_servers         = ["8.8.8.8", "8.8.4.4"]
}

resource "azurerm_subnet" "portfolio" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.portfolio.name
  address_prefixes     = [var.subnet_address_prefix]
}

resource "azurerm_public_ip" "portfolio" {
  name                = var.public_ip_address_name
  location            = var.location
  resource_group_name = var.resource_group_name
  # README asks for "Dynamic", but Basic SKU public IPs are retired;
  # Standard SKU requires static allocation.
  allocation_method = "Dynamic"
  sku               = "Basic"
  domain_name_label = "${var.dns_label}${random_integer.dns_label.result}"
}

resource "azurerm_subnet_network_security_group_association" "portfolio" {
  subnet_id                 = azurerm_subnet.portfolio.id
  network_security_group_id = azurerm_network_security_group.portfolio.id
}
