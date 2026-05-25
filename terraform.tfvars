subscription_id = "b1e27144-9a08-4722-8311-9fce7db53f60" # ← your Azure Subscription ID

location            = "uksouth"
resource_group_name = "mate-azure-task-12"
environment         = "dev"

# Network
virtual_network_name        = "vnet"
vnet_address_prefix         = ["10.0.0.0/16"]
subnet_name                 = "default"
subnet_address_prefix       = ["10.0.0.0/24"]
network_security_group_name = "defaultnsg"
public_ip_address_name      = "linuxboxpip"
dns_label                   = "matetask"

# Compute
vm_name        = "matebox"
vm_size        = "Standard_B1s"
ssh_key_public = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCnTufDrlK40pNPp2Qho8Z7aixGNbV7q1hkfJzIUcQiYsr5eN1Utc/zx1E6IPDyHi+t4E5GKDm88yU8FbeDL3ShAULkB4/UvQzmTho2DjHRBEfAo9Z/pPkv0HJYtlgdol0aCwo30vWr/dRtq6Ir2Iw5hAZcAe3hKg2Qq9VfjBjiOTl434ONar0wajnApA550nuWEKU/vvQEBdP8Lx+vulteTGmvP9JWV4ZhWQVJkArYi0wvRX1UEoEj/P/eXNQl+h7BwxGRa3OyUaU7yCRE0QKba0mesAwSBdncs+tFqoNQD7JiCR7QnSzKoQ7MJQg/945d86UijPisT9IGGDyyB9kZrEUR/ePrCuH+xhFXuOdHectdH3xzui00zhdoiov6XfTYMrzoOF1+aJJFMI42yySGV5lWknfvIfAAr/1j6/1HPAIX/FDnlUPRRuMMLWHUAguW/oqXIRKzpR6h4/YVCe/cToHpPIkd3jZpCNADKXkp4Eoef78lOn1S71gVjzk1LOk="  # ← replace

# Storage
storage_account_name   = "matetaskappstorage"
storage_container_name = "task-artifacts"

# Tags
tags = {
  owner = "your-name"
}