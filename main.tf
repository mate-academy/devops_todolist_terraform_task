terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.105.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source = "./modules/network"

  resource_group_name         = azurerm_resource_group.example.name
  location                    = azurerm_resource_group.example.location
  vnet_address_prefix         = var.vnet_address_prefix
  virtual_network_name        = var.virtual_network_name
  network_security_group_name = var.network_security_group_name
  subnet_name                 = var.subnet_name
  subnet_address_prefix       = var.subnet_address_prefix
  public_ip_address_name      = var.public_ip_address_name
  dns_label                   = var.dns_label
}

module "compute" {
  source = "./modules/compute"

  vm_name                   = var.vm_name
  resource_group_name       = azurerm_resource_group.example.name
  location                  = azurerm_resource_group.example.location
  admin_username            = var.admin_username
  vm_size                   = var.vm_size
  ssh_key_public            = var.ssh_key_public
  install_script_url        = var.install_script_url
  subnet_id                 = module.network.subnet_id
  public_ip_id              = module.network.public_ip_id
  network_security_group_id = module.network.network_security_group_id
}

module "storage" {
  source = "./modules/storage"

  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  my_account_name     = var.my_account_name
}