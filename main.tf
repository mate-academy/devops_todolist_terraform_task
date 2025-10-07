provider "azurerm" {
  features {}
  subscription_id = "529c3a3b-3e28-4cb1-9c07-d7210a188a92"
}

module "network" {
  source = "./modules/network"

  location              = var.location
  resource_group_name   = var.resource_group_name
  vnet_name             = var.vnet_name
  vnet_address_prefix   = var.vnet_address_prefix
  subnet_name           = var.subnet_name
  subnet_address_prefix = var.subnet_address_prefix
  nsg_name              = var.nsg_name
  public_ip_name        = var.public_ip_name
  dns_label             = var.dns_label
}

module "compute" {
  source = "./modules/compute"

  location            = var.location
  resource_group_name = var.resource_group_name
  vm_name             = var.vm_name
  vm_size             = var.vm_size
  ssh_key             = var.ssh_key_public
  subnet_id           = module.network.subnet_id
  public_ip_id        = module.network.public_ip_id
  nsg_id              = module.network.nsg_id
}

module "storage" {
  source = "./modules/storage"

  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_name = var.storage_account_name
  container_name       = var.container_name
}