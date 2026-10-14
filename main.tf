resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source = "./modules/network"

  resource_group_data = {
    name     = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
  }

  virtual_network_name        = var.virtual_network_name
  vnet_address_prefix         = var.vnet_address_prefix
  subnet_name                 = var.subnet_name
  subnet_address_prefix       = var.subnet_address_prefix
  network_security_group_name = var.network_security_group_name
  public_ip_address_name      = var.public_ip_address_name
  dns_label                   = var.dns_label
  security_rules              = var.security_rules
}

module "compute" {
  source = "./modules/compute"

  resource_group_data = {
    name     = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
  }
  vm_name           = var.vm_name
  vm_size           = var.vm_size
  subnet_id         = module.network.subnet_id
  ssh_key_public    = var.ssh_key_public
  public_ip_id      = module.network.public_ip_id
  public_ip_address = module.network.public_ip_address
}

module "storage" {
  source = "./modules/storage"

  resource_group_data = {
    name     = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
  }
  sc_name = var.sc_name
  sa_name = var.sa_name
}
