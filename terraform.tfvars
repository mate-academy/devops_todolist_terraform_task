location            = "uksouth"
resource_group_name = "mate-azure-task-12"

virtual_network_name        = "vnet"
vnet_address_prefix         = "10.0.0.0/16"
subnet_name                 = "default"
subnet_address_prefix       = "10.0.0.0/24"
network_security_group_name = "defaultnsg"
public_ip_address_name      = "linuxboxpip"
dns_label                   = "matetask"

vm_name        = "matebox"
vm_size        = "Standard_B1s"
admin_username = "azureuser"
ssh_key_public = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIdHUkSxau+yb8G5UPXkz41pfhrRFY3Sgbke/nDP/ihL yaros@DESKTOP-KS37CUL"

storage_account_name   = "matetask6storageacc12345"
storage_container_name = "task-artifacts"