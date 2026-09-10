location = "uksouth"

resource_group_name = "mate-azure-task-12"

security_rules = [
  {
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  },
  {
    name                       = "HTTP"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
]

virtual_network_name = "vnet"

vnet_address_prefix = "10.0.0.0/16"

subnet_name = "default"

subnet_address_prefix = "10.0.0.0/24"

network_security_group_name = "defaultnsg"

public_ip_address_name = "linuxboxpip"

dns_label = "matetask"

vm_name = "matebox"

vm_size = "Standard_B1s"

ssh_key_public = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDZhJqQNa1TxHfXR+RXbSmbDi50vN3XP0mE7sKHIfTHPBewOpcl0LEjhU2de2fNZ1us+e4YDv9NayEw/em/hWsg0vGEdWDcXO49wTzFKxSajwL7h60bWoa6CNLGDTqw3o4zKFPxzZSrvVPg5PdqMYFWmHiWZywb0h0a4XT33gIphuA+EMDAHPwOjwYUC/9zmnvdSPT4p8BzY92NKSaoDG9rrSFiBEkEDYUe2o17fH8cAmzcHPknBnwnLnRsu6f54/JsVStSgLMhyOEfG/HYle9vcZI/VlH6wCpzIw1Sh8mKeBMfwsYQb59OsgwtEmrSDcO6BKi/Ne+b7CNMur6jjNXfWaiamcSYmCanJNOQxU1dE7Mptu4q6oFxN6EhbLT7ANLDOqgtilIWjGcpOYFywCyB+c+xsglza7PxEwA2hExifAsxNh2ehblKVxdpwmNCk6D38MkAfvwJiQZHYhvkXyNseGpbrUhyw42q2SWERzWIqMt3o0blgEvWt0Uw7aibLsZbfDCxuzkkCHjH5Xy0cekQGTpnsk3kViLBXg0EM4OnaLpIw88Xb5Km3aJ8CYS2M6aeqqtlnxIL8oytyAX2uhzolGWvYfy6rPA5KidERIse9XTbE4d1HAx+uzYGTZnj8qhEhdWyII0iNMGyA7K5MJFAYfj9Uez8LUv6HPkn3jWEdw=="

sa_name = "taskmateacademy"

sc_name = "task-artifacts"