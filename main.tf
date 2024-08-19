resource "azurerm_resource_group" "main" {
  name     = var.rg_name
  location = var.region
}

module "network_module" {
  depends_on                  = [azurerm_resource_group.main]
  source                      = "./modules/network"
  net_resource_group_name     = var.rg_name
  net_location                = var.region
  net_vnet_name               = var.vnet_name
  net_vnet_address_space      = var.vnet_address_space
  net_subnet_name             = var.subnet_name
  net_subnet_address_prefixes = var.subnet_address_prefixes
  net_pubip_name              = var.pubip_name
  net_nsg_name                = var.nsg_name
  net_pubip_dns_prefix        = var.pubip_dns_prefix
}

module "compute_module" {
  depends_on                  = [module.network_module, module.storage_module]
  source                      = "./modules/compute"
  comp_resource_group_name    = var.rg_name
  comp_location               = var.region
  comp_nic_ip_conf_name       = var.nic_ip_conf_name
  comp_nic_subnet_id          = module.network_module.net_subnet.id
  comp_pubip_id               = module.network_module.net_pubip.id
  comp_vm_name                = var.vm_name
  comp_vm_size                = var.vm_size
  comp_vm_user_name           = var.vm_user_name
  comp_vm_user_password       = var.vm_user_password
  comp_custom_script_url      = local.custom_script_url
  comp_custom_script_filename = var.blob_name
}

module "storage_module" {
  depends_on               = [azurerm_resource_group.main]
  source                   = "./modules/storage"
  strg_resource_group_name = var.rg_name
  strg_location            = var.region
  strg_container_name      = var.container_name
  strg_blob_name           = var.blob_name
  strg_blob_source         = var.blob_source
}
