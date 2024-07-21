location                    = "uksouth"
resource_group_name         = "mate-azure-task-12"
virtual_network_name        = "vnet"
vnet_address_prefix         = "10.0.0.0/16"
subnet_name                 = "default"
subnet_address_prefix       = "10.0.0.0/24"
network_security_group_name = "defaultnsg"
public_ip_address_name      = "linuxboxpip"
vm_name                     = "matebox"
vm_size                     = "Standard_B1s"
ssh_key_public              = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDb4Yoa3tEpy92WT0u963xnKfE5j1gbBwmFnNWAGIwIQacyXCnBIhUOM+IWO2NnF7Qf9c0uby6+ymgXms7G/sQRMNBFPP10+qZ6ZFXpjT/JPnfxalMeRahhCQXWGXj1jiyZWcF4LE5As1burd5korO8CmprbkhjYqJhmj5ONpk7ldZeKDS3Q8gYZ6+M1tqcY1rVQ3fKuvDXs8JMCLWeHSm+xi8qsqt5kjs18y5lpZPDDwbcjbMKUgsJHqasz5bgnnT9YBc+HzcI/B6DjbX2LgMHDPIVG5UyxdWFjRsVdtkRjfYMNBI2efJWUDCWhdMQ7/mUdfF+QKprD3ssBASVWd9/ ipppk@LAPTOP"
dns_label                   = "matetask"
extension_name              = "install_script"
