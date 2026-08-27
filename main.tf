resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}


module "network" {
  source                      = "./modules/network"
  resource_group_name         = azurerm_resource_group.main.name
  location                    = var.location
  virtual_network_name        = var.virtual_network_name
  vnet_address_prefix         = var.vnet_address_prefix
  subnet_name                 = var.subnet_name
  subnet_address_prefix       = var.subnet_address_prefix
  network_security_group_name = var.network_security_group_name
  public_ip_address_name      = var.public_ip_address_name
  dns_label                   = var.dns_label
}

module "compute" {
  source              = "./modules/compute"
  vm_name             = var.vm_name
  resource_group_name = azurerm_resource_group.main.name
  vm_size             = var.vm_size
  location            = var.location
  subnet_id           = module.network.subnet_id
  ssh_key_public      = var.ssh_key_public
  public_ip_id        = module.network.public_ip_id
}

module "storage" {
  source              = "./modules/storage"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
}
