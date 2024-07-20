resource "azurerm_network_interface" "nic" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_address_id
  }
}

resource "azurerm_public_ip" "vm_ip" {
  name                = "${var.vm_name}-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}

resource "azurerm_virtual_machine" "vm" {
  name                  = var.vm_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size               = var.vm_size

  os_profile {
    computer_name  = var.vm_name
    admin_username = var.admin_username
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      path     = "/home/${var.admin_username}/.ssh/authorized_keys"
      key_data = var.ssh_key_public
    }
  }

  storage_os_disk {
    name              = "${var.vm_name}_osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  tags = var.tags

  provisioner "file" {
    source      = "C:/Users/ipppk/devops_todolist_terraform_task/install-app.sh"
    destination = "/home/${var.admin_username}/install-app.sh"

    connection {
      type        = "ssh"
      user        = var.admin_username
      private_key = file(var.ssh_key_private)
      host        = azurerm_public_ip.vm_ip.ip_address
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/${var.admin_username}/install-app.sh",
      "bash /home/${var.admin_username}/install-app.sh"
    ]

    connection {
      type        = "ssh"
      user        = var.admin_username
      private_key = file(var.ssh_key_private)
      host        = azurerm_public_ip.vm_ip.ip_address
    }
  }
}
