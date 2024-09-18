terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0" # Adjust to the version you need
    }
  }
}

provider "azurerm" {
  features {}
}

module "network" {
  source                      = "./modules/network"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  dns_label                   = var.dns_label
}

module "compute" {
  source              = "./modules/compute"
  vm_name             = var.vm_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.network.subnet_id
  public_ip_id        = module.network.public_ip_address
  vm_size             = var.vm_size
  ssh_key_public      = var.ssh_key_public
}

module "storage" {
  source              = "./modules/storage"
  location            = var.location
  resource_group_name = var.resource_group_name
}
