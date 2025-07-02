# resource "azurerm_resource_group" "example" {
#   name = var.resource_group_name
#   location = var.location
# }
module "network" {
  source                      = "./modules/network"
  dns_label                   = var.dns_label
  location                    = var.location
  resource_group_name         = var.resource_group_name
  network_security_group_name = var.network_security_group_name
  public_ip_address_name      = var.public_ip_address_name
  virtual_network_name        = var.virtual_network_name
  subnet_name                 = var.subnet_name
  subnet_address_prefix       = var.subnet_address_prefix
  vnet_address_prefix         = var.vnet_address_prefix
}

module "compute" {
  source                 = "./modules/compute"
  location               = var.location
  resource_group_name    = var.resource_group_name
  public_ip_address_name = var.public_ip_address_name
  ssh_key_public         = var.ssh_key_public
  subnet_name            = var.subnet_name
  virtual_network_name   = var.virtual_network_name
  vm_name                = var.vm_name
  vm_size                = var.vm_size
  depends_on             = [module.network]
}

module "storage" {
  source              = "./modules/storage"
  location            = var.location
  resource_group_name = var.resource_group_name
  depends_on          = [module.network, module.compute]
}