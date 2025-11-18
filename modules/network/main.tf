resource "random_integer" "dns_suffix" {
  min = 1000
  max = 9999
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  address_space       = [var.vnet_address_prefix]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "default" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_address_prefix]
}

resource "azurerm_network_security_group" "defaultnsg" {
  name                = var.network_security_group_name
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "security_rule" {
    for_each = [
      { name = "Allow-SSH", priority = 100, direction = "Inbound", access = "Allow", protocol = "Tcp", port = 22 },
      { name = "Allow-HTTP", priority = 200, direction = "Inbound", access = "Allow", protocol = "Tcp", port = 80 },
      { name = "Allow-HTTP2", priority = 300, direction = "Inbound", access = "Allow", protocol = "Tcp", port = 8080 }
    ]
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = "*"
      destination_port_range     = security_rule.value.port
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "default" {
  subnet_id                 = azurerm_subnet.default.id
  network_security_group_id = azurerm_network_security_group.defaultnsg.id
}

resource "azurerm_public_ip" "linuxboxpip" {
  name                = var.public_ip_address_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  domain_name_label   = "${var.dns_label_prefix}${random_integer.dns_suffix.result}"
}
