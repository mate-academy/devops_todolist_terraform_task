provider "azurerm" {
  features {}
}

# В задании сказано, что RG может быть создана отдельно или здесь. 
# Используем data, если она уже есть, или resource, если создаем с нуля:
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source         = "./modules/network"
  rg_name        = azurerm_resource_group.rg.name
  location       = azurerm_resource_group.rg.location
  vnet_name      = var.virtual_network_name
  address_prefix = var.vnet_address_prefix
  subnet_name    = var.subnet_name
  subnet_prefix  = var.subnet_address_prefix
  nsg_name       = var.network_security_group_name
  pip_name       = var.public_ip_address_name
  dns_label      = var.dns_label
}

module "compute" {
  source         = "./modules/compute"
  rg_name        = azurerm_resource_group.rg.name
  location       = azurerm_resource_group.rg.location
  subnet_id      = module.network.subnet_id
  public_ip_id   = module.network.public_ip_id
  vm_name        = var.vm_name
  vm_size        = var.vm_size
  ssh_key_public = var.ssh_key_public
}

module "storage" {
  source   = "./modules/storage"
  rg_name  = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
}
