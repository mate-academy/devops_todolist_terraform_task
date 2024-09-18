provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
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
