terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}

# resource "azurerm_resource_group" "main" {
#   name     = var.resource_group_name
#   location = var.location
# }

module "network" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
  domain_name_label   = var.dns_label
}

module "storage" {
  source               = "./modules/storage"
  resource_group_name  = var.resource_group_name
  location             = var.location
  storage_account_name = var.storage_account_name
}

module "compute" {
  source               = "./modules/compute"
  resource_group_name  = var.resource_group_name
  location             = var.location
  vm_name              = var.vm_name
  subnet_id            = module.network.subnet_id
  public_ip_address_id = module.network.public_ip_id
  linuxboxsshkey       = var.ssh_key_public
}