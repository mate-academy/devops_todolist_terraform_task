resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  address_space       = var.vnet_address_prefix
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_address_prefix
}

resource "azurerm_network_security_group" "defaultnsg" {
  name                = var.network_security_group_name
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "security_rule" {
    for_each = var.nsg_rules

    content {
      name                       = security_rule.value["name"]
      priority                   = security_rule.value["priority"]
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = security_rule.value["destination_port_range"]
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}

resource "random_id" "dns_suffix" {
  byte_length = 2
}

resource "azurerm_public_ip" "linuxboxpip" {
  name                = var.public_ip_address_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Dynamic"
  sku                 = "Basic"
  domain_name_label   = "${var.dns_label}${random_id.dns_suffix.hex}"
}
