module "network" {
  source = "./modules/network"

  resource_group_name         = var.resource_group_name
  location                    = var.location
  virtual_network_name        = var.virtual_network_name
  vnet_address_prefix         = var.vnet_address_prefix
  subnet_name                 = var.subnet_name
  subnet_address_prefix       = var.subnet_address_prefix
  network_security_group_name = var.network_security_group_name
  public_ip_address_name      = var.public_ip_address_name
  dns_label                   = var.dns_label
}

module "storage" {
  source = "./modules/storage"

  resource_group_name  = var.resource_group_name
  location             = var.location
  storage_account_name = var.storage_account_name
  container_name       = var.container_name
}

module "compute" {
  source = "./modules/compute"

  resource_group_name = var.resource_group_name
  location            = var.location
  vm_name             = var.vm_name
  vm_size             = var.vm_size
  ssh_key_public      = file(var.ssh_key_public)
  subnet_id           = module.network.subnet_id
  public_ip_id        = module.network.public_ip_id

}