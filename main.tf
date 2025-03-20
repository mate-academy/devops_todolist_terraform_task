resource "azurerm_resource_group" "rg" {
  name     = "mate-azure-task-12"
  location = "uksouth"
}


module "network" {
  depends_on                  = [azurerm_resource_group.rg]
  source                      = "./modules/network"
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  virtual_network_name        = var.virtual_network_name
  vnet_address_prefix         = var.vnet_address_prefix
  subnet_name                 = var.subnet_name
  subnet_address_prefix       = var.subnet_address_prefix
  network_security_group_name = var.network_security_group_name
  public_ip_address_name      = var.public_ip_address_name
  dns_label                   = var.dns_label

}

module "compute" {
  depends_on           = [module.network]
  source               = "./modules/compute"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  vm_name              = var.vm_name
  vm_size              = var.vm_size
  ssh_pub_key_file     = var.ssh_pub_key_file
  ssh_private_key_file = var.ssh_private_key_file
  subnet_id            = module.network.subnet_id
  public_ip_id         = module.network.public_ip_id
  public_ip_fqdn       = module.network.public_ip_fqdn

}

module "storage" {
  depends_on          = [azurerm_resource_group.rg]
  source              = "./modules/storage"
  location            = azurerm_resource_group.rg.location
  resource_group_name = var.resource_group_name

}
