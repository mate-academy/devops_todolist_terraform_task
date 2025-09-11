terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
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

  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = {}
}

module "storage" {
  source = "./modules/storage"

  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}

module "compute" {
  source = "./modules/compute"

  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  vm_name             = var.vm_name
  vm_size             = var.vm_size
  subnet_id           = module.network.subnet_id
  public_ip_id        = module.network.public_ip_id
  ssh_key_public      = var.ssh_key_public
}