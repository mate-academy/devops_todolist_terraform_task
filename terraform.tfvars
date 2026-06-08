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
dns_label                   = "matetask"
storage_account_name_prefix = "matetasksa"
storage_container_name      = "task-artifacts"

# Replace with your SSH public key content.
ssh_key_public = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC4FQdSv8EH9C5Mdb2sdJb0+DP2rN34M3GWUXnsj+xBv+v35sPj1RTTioChcfXDZozp7nkPPeUwP0l17/H+LYUgZAYdsGFkIbwWzqJnjpGLpe016AcgN34f0uirjxgKR/Z3BEvbxHDgpmoVomio8W2vJbrAG1c/twg47wxSc0t6cA9GZBHCpbDVte1vea8DX6xrrV03JOnGbgUeL/gM/zslZCklIrJgESenY3NvF4ys/FuJbnE8cEn8RR6UubIoQq3umXq3u6UStKx1fM0f/ev/ShTlmTxw87/qsXZ1wVhhcQmUHiZoIJuk/K6Wx5Ytynd9YLxLwKq43YMyCHKpWwvvXY2Nn36/kgBtyCCYxi55Ul81wM8SZMtqRn8l6zMp8GHD0it4N1qL6OMpjxOeenxWkmyJBZsPEelfJe2ALoIusZpHdX8w5xW0DP6SgL1fp8EhvF5BzunV1l5jAcVoTq4EQwwO+2AJ+2gSeGtxvmmaqO8bDwBEl91TircrRSSWJkU="

# Replace with your fork URL.
repository_url = "https://github.com/dimonalek/devops_todolist_terraform_task.git"
