resource_group_name     = "mate-azure-task-12"
resource_group_location = "uksouth"
storage_account_name    = "storageippk"
container_name          = "tfstate"
security_group_name     = "defaultnsg"
vnet_name               = "vnet"
subnet_name             = "default"
public_ip_name          = "linuxboxpip"
vm_name                 = "matebox"
extension_name          = "installApp"
domain_name_label       = "matetask"
vm_size                 = "Standard_B1s"
vnet_address            = "10.0.0.0/16"
subnet_address_prefix   = "10.0.0.0/24"
admin_username          = "azureuser"
admin_password          = "azureuser"
key_data                = "C:\\Users\\ipppk\\.ssh\\id_rsa.pub"
