resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
module "network_module" {
  source                      = "./modules/network"
  virtual_network_name        = var.virtual_network_name
  vnet_address_prefix         = var.vnet_address_prefix
  resource_group_name         = var.resource_group_name
  location                    = var.location
  subnet_name                 = var.subnet_name
  subnet_address_prefix       = var.subnet_address_prefix
  network_security_group_name = var.network_security_group_name
  public_ip_address_name      = var.public_ip_address_name
  dns_label                   = var.dns_label
}
module "storage_module" {
  source                 = "./modules/storage"
  resource_group_name    = var.resource_group_name
  location               = var.location
  storage_account_name   = var.storage_account_name
  storage_container_name = var.storage_container_name
}
module "vm_module" {
  source              = "./modules/compute"
  resource_group_name = var.resource_group_name
  location            = var.location
  vm_name             = var.vm_name
  vm_size             = var.vm_size
  ssh_key_public      = var.ssh_key_public
  subnet_id           = module.network_module.subnet_id
  pip_id              = module.network_module.public_ip_id
}