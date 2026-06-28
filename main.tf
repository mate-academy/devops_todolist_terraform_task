terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.79.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source = "./modules/network"

  location                    = var.location
  resource_group_name         = azurerm_resource_group.main.name
  virtual_network_name        = var.virtual_network_name
  vnet_address_prefix         = var.vnet_address_prefix
  subnet_name                 = var.subnet_name
  subnet_address_prefix       = var.subnet_address_prefix
  network_security_group_name = var.network_security_group_name
  public_ip_address_name      = var.public_ip_address_name
  dns_label                   = var.dns_label
}

module "storage" {
  source = "./modules/storage"

  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
}

module "compute" {
  source = "./modules/compute"

  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  vm_name             = var.vm_name
  vm_size             = var.vm_size
  subnet_id           = module.network.subnet_id
  public_ip_id        = module.network.public_address_ip_id
  ssh_key_public      = var.ssh_key_public
}