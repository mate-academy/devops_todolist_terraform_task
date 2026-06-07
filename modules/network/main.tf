terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }
}


provider "azurerm" {
  features {}
}

resource "random_id" "dns_suffix" {
  byte_length = 2
}



resource "azurerm_public_ip" "example" {
  name                = var.public_ip_address_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  domain_name_label   = "matetask${random_id.dns_suffix.dec}"
  sku = "Standard"

  tags = {
    environment = "Production"
  }


   lifecycle {
    create_before_destroy = true
  }
}

resource "azurerm_virtual_network" "example" {
  name                = var.virtual_network_name
  address_space       = [var.vnet_address_prefix]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "example" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = [var.subnet_address_prefix]
}

resource "azurerm_network_security_group" "example" {
  name                = var.network_security_group_name
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "allow-http"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }


  tags = {
    environment = "staging"
  }
}

