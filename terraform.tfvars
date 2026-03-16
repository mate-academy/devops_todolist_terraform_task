location              = "uksouth"
resource_group_name   = "mate-azure-task-12"
virtual_network_name  = "vnet"
vnet_address_prefix   = "10.0.0.0/16"
subnet_name           = "default"
subnet_address_prefix = "10.0.0.0/24"

network_security_group_name = "defaultnsg"
public_ip_address_name      = "linuxboxpip"
vm_name                     = "matebox"
vm_size                     = "Standard_B1s"
admin_username              = "azureuser"

ssh_key_public         = "ssh-rsa REPLACE_WITH_YOUR_PUBLIC_KEY"
dns_label              = "matetask"
storage_container_name = "task-artifacts"

script_url     = "https://raw.githubusercontent.com/<your-gh-username>/devops_todolist_terraform_task/main/install-app.sh"
repository_url = "https://github.com/<your-gh-username>/devops_todolist_terraform_task.git"
