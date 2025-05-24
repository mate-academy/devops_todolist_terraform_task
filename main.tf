terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.105.0"
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


module "compute" {
  source                       = "./modules/compute"
  location                     = azurerm_resource_group.main.location
  resource_group_name          = azurerm_resource_group.main.name
  subnet_id                    = module.network.subnet_id
  public_ip_id                 = module.network.public_ip_id
  ssh_key_public               = var.ssh_key_public
  azurerm_virtual_machine      = var.azurerm_virtual_machine
  azurerm_virtual_machine_size = var.azurerm_virtual_machine_size

}

module "network" {
  source                         = "./modules/network"
  location                       = azurerm_resource_group.main.location
  resource_group_name            = azurerm_resource_group.main.name
  azurerm_virtual_network        = var.azurerm_virtual_network
  vnet_address_prefix            = var.vnet_address_prefix
  azurerm_subnet_address_prefix  = var.azurerm_subnet_address_prefix
  azurerm_network_security_group = var.azurerm_network_security_group
  azurerm_public_ip              = var.azurerm_public_ip
  dns_label                      = var.dns_label
}

module "storage" {
  source              = "./modules/storage"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}
