location = "uksouth"
resource_group_name = "mate-azure-task-12"

virtual_network_name  = "vnet"
vnet_address_prefix   = "10.0.0.0/16"
subnet_name           = "default"
subnet_address_prefix = "10.0.0.0/24"

network_security_group_name = "defaultnsg"
public_ip_address_name      = "linuxboxpip"

vm_name = "matebox"
vm_size = "Standard_B1s"


ssh_key_public = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDl8hEJpaV2+h62TClOZ4ojtAHeGLfCCFYpmxGwqnpGlE49kH5tIq+5+hRBf5M2kroA/FT4J0VvYY7y+1Wu0g495HogXgaIS9Ej26qVF+7x2TEq1+YTv1dsnu6PY9V25uBbZlKLJ5JU4tpTKvpkM1fJgITWfzp05yhb8SD0F1P8CHD1aQ91/wtygf/dTa/Or3gY1Ci+u3Y8D7bb7errS+BApiUFW/Y3qdVfshQzJM4M+X5LEGo8l539RlvhGoB2J1BPVoPMf8xcb+a1eUfjmrnCK/Xhe19LMrWl1Vew5f7JavqL4Jd+M5Sde1014WJgsYGS+KlZvHW0f9D6eFq3aDdbvQsm/OBg/0Ds1rjkeqyFJp1fykGjIMEYXL5y3XEr2fvncCyNq00fAnHJUYMEv+hvI4B1rceudufcumEHPOguDyf9W86kFvrHLkrXX4Sw3fOK+p7ZaEBbFbMCzzG79vHXUKuDV8w9+xbku3BmtMpz14VKGlwqCwwsU0KIe5Crq3kHCNWNc0ElRr+L3IdlJZ+E8Wppqh1u9z/W05ElxqOWBm1SrUy6cxWNPkKBzHUlq8bAX9uNvKsX2gLi5lCBqXf456xEnw5uujreHQhHNg4PQvjR2IT1n9DaFK2zhpbKRKKMxOVGKZnNQEMs9E7wIAvEaFP+whSuhFZdASpmLqdyNQ== matebox"

dns_label = "matetask"
