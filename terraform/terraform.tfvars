# Network configuration variables
resource_group_name         = "mate-azure-task-12"
location                    = "uksouth"
virtual_network_name        = "vnet"
vnet_address_prefix         = "10.0.0.0/16"
subnet_address_prefix       = "10.0.0.0/24"
subnet_name                 = "default"
network_security_group_name = "defaultnsg"
public_ip_address_name      = "linuxboxpip"
dns_label                   = "matetask"

# Compute configuration variables
vm_name             = "matebox"
vm_size             = "Standard_B1s"
admin_username      = "whatislavx"
script_file         = "install-app.sh"
ssh_key_public_path = "../id_rsa_azure.pub"

# Storage configuration variables
storage_account_name = "yourstorageaccount"
container_name       = "task-artifacts"
