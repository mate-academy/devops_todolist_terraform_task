terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.105.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "storage" {
  source = "./modules/storage"
  location = var.location
  resource_group_name = var.resource_group_name
}
module "network-module" {
    source = "./modules/network"
    resource_group_name = var.resource_group_name
    location = var.location
    virtual-network-name = var.virtual_network_name
    subnet-name = var.subnet_name
    network-security-group-name = var.network_security_group_name
    pip-name = var.public_ip_address_name
    subnet_address_prefix = var.subnet_address_prefix
    vnet_address_prefix = var.vnet_address_prefix
}

module "compute" {
  source = "./modules/compute"
  resource_group_name = var.resource_group_name
  location = var.location
  vm_name = var.vm_name
  vm_size = var.vm_size
  vm_ssh_key = var.vm_ssh_key
  subnet_id = module.network-module.subnet-id
  pip_id = module.network-module.pip-id
}
