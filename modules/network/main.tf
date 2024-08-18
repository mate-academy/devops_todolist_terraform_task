resource "azurerm_virtual_network" "main" {
  name                = var.net_vnet_name
  address_space       = var.net_vnet_address_space
  location            = var.net_location
  resource_group_name = var.net_resource_group_name
}

resource "azurerm_subnet" "main" {
  name                 = var.net_subnet_name
  resource_group_name  = var.net_resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.net_subnet_address_prefixes
}

resource "azurerm_network_security_group" "main" {
  name                = var.net_nsg_name
  resource_group_name = var.net_resource_group_name
  location            = var.net_location

  dynamic "security_rule" {
    for_each = var.net_security_rules
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

resource "azurerm_public_ip" "main" {
  name                = var.net_pubip_name
  resource_group_name = var.net_resource_group_name
  location            = var.net_location
  sku                 = var.net_pubip_sku
  allocation_method   = var.net_pubip_allocation_method
  domain_name_label   = local.dns_label
}
