terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.105.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.8.1"
    }
  }
}
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source = "./modules/network"

  virtual_network_name        = var.virtual_network_name
  vnet_address_prefix         = var.vnet_address_prefix
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  subnet_name                 = var.subnet_name
  subnet_address_prefix       = var.subnet_address_prefix
  public_ip_address_name      = var.public_ip_address_name
  network_security_group_name = var.network_security_group_name
  dns_label                   = var.dns_label
}

module "compute" {
  source              = "./modules/compute"
  vm_name             = var.vm_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = module.network.subnet_id
  public_ip_id        = module.network.public_ip_id
  vm_size             = var.vm_size
  ssh_key_public      = var.ssh_key_public
  github_repo         = var.github_repo

}

module "storage" {
  source              = "./modules/storage"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}