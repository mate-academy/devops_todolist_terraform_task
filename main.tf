terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.36.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "random_integer" "suffix" {
  min = 1000
  max = 9999
}

module "network" {
  source                = "./modules/network"
  location              = var.location
  network_name          = var.network_name
  nsg_name              = var.nsg_name
  subnet_name           = var.subnet_name
  subnet_address_prefix = var.subnet_address_prefix
  public_ip_name        = var.public_ip_name
  vnet_address_space    = var.vnet_address_space
  resource_group_name   = var.resource_group_name
  dns_label             = "${var.dns_label}-${random_integer.suffix.result}"
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "compute" {
  source               = "./modules/compute"
  location             = var.location
  resource_group_name  = var.resource_group_name
  vm_name              = var.vm_name
  subnet_id            = module.network.subnet_id
  public_ip_address_id = module.network.public_ip_address_id
  vm_size              = var.vm_size
  ssh_key_public       = var.ssh_key_public
  admin_username       = var.admin_username
}

module "storage" {
  source               = "./modules/storage"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_name = var.storage_account_name
  container_name       = var.container_name
}