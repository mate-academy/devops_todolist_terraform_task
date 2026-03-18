resource "azurerm_virtual_network" "vnet" {
  name = var.virtual_network_name

  location            = var.location
  resource_group_name = var.resource_group_name

  address_space = [var.vnet_address_prefix]
}

resource "azurerm_subnet" "default" {
  name = var.subnet_name

  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_address_prefix]

  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_group" "default_nsg" {
  name = var.network_security_group_name

  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name = "allow-https"

    access    = "Allow"
    direction = "Inbound"
    protocol  = "Tcp"
    priority  = 100

    source_port_range      = "*"
    destination_port_range = "8080"

    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name = "allow-ssh"

    access    = "Allow"
    direction = "Inbound"
    protocol  = "Tcp"
    priority  = 110

    source_port_range      = "*"
    destination_port_range = "22"

    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "random_integer" "random_dns_name" {
  min = 1
  max = 100000
}

resource "azurerm_public_ip" "linux_box_pip" {
  name = var.public_ip_address_name

  location            = var.location
  resource_group_name = var.resource_group_name

  sku               = "Standard"
  allocation_method = "Static"
  domain_name_label = "${var.dns_label}-${random_integer.random_dns_name.result}"
}
