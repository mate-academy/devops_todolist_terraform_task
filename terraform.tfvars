install_script_url = "https://raw.githubusercontent.com/1ntact/devops_todolist_terraform_task/main/install-app.sh"

storage_account_name = "yamfilmerkil"

location            = "denmarkeast"
resource_group_name = "mate-azure-task-12"

virtual_network_name = "vnet"
vnet_address_prefix  = ["10.0.0.0/16"]

subnet_name           = "default"
subnet_address_prefix = ["10.0.0.0/24"]

dns_servers = []

network_security_group_name = "defaultnsg"
public_ip_address_name      = "linuxboxpip"
dns_label                   = "matetask"

vm_name        = "matebox"
vm_size        = "Standard_B1s"
admin_username = "mate"
ssh_key_public = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDeTG0Uh7IjOmZ7p6N15sWJYUGsxdGrDHQF4FqjlN75AXDnekGEFehrt2ZQjSrgGDLzgVG5iRy0FqyMt8If1/51rOXgvib5BF8+xsTR+4LTG46XYlsN2TvBHVJ1WaDGnnLNoKo3he2oa/dFdO+HF+gWYHtHJ5mNtnbNOYrRyHpc1CYdGubCjRBb3PxGtUVPQNWBYCVD+gqTdQmp5kSjJSyd542iIeGD/QolsnlNbiEyPBTrG/vCfvpDww0CujPw6FTY1JMUYGIJaFWIp2Btk9EcJKvypFu6fd9eL6+VJ/POrnD8b62bcOcAJ7neujKOu/CV6OQnbb/F3y0vwLdBfBNQpan4Pzh1XEe0lKGCC6JaRACDlCgjNxgd34O4h20y+OxxLieJy9izPQFXbkhhsl5i/mHYbvXeHETwuyDfH6gCCwciNiin3hOQqyo1KX0Pqg0//sVJtu8Ll7WRTxdNGOuHVkj0+n6oAUVdoCGEuAU6AbBykyqu1LiwohCSTzdI9EHL5VHqiY6cjxKOtZK/Q56Ov2HgWV29MK6FjnY2jpNiEBuD4WPGCsmQq2n15yt4sDIGZvXZFL2317n/pN3vH+NDAXg6RQk2OUp3ivOuKsl9WvsWr4l68jaWbvzv0EITgFOmwkWdiG7/Qw+tPHx1dyDBSeVRxoD9zBC7skbVhQpOMw== verbaivan9@gmail.com"

os_disk_caching              = "ReadWrite"
os_disk_storage_account_type = "Standard_LRS"