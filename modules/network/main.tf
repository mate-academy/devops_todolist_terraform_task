resource "azurerm_virtual_network" "main" {
  name                = "vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "internal" {
  name                 = "default"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_network_security_group" "default-nsg" {
  name                = "default-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
      name                       = "TaskRule"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
resource "azurerm_public_ip" "linuxboxpip" {
  name                = "linuxboxpip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Dynamic"
  domain_name_label = "${var.dns_label_prefix}${random_integer.random.result}"
}

resource "random_integer" "random" {
  min = 1000
  max = 9999
}
