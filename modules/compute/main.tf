# Define the Public IP for the VM
resource "azurerm_public_ip" "linuxboxpip" {
  name                = "linuxboxpip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static" # Changed from Dynamic to Static

  tags = {
    project     = "vr89project"
    environment = "dev"
    owner       = "vr89"
  }
}

# Define the Network Interface for the VM
resource "azurerm_network_interface" "vm_nic" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.linuxboxpip.id
  }

  tags = {
    project     = "vr89project"
    environment = "dev"
    owner       = "vr89"
  }
}

# Define the Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "matebox" {
  name                  = "vr89project-vm"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.vm_nic.id]
  size                  = "Standard_B1s"

  admin_username = "azureuser"

  admin_ssh_key {
    username   = "azureuser"
    public_key = var.ssh_key # Correctly references the SSH key passed via the -var flag
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 30
  }

  # Update the image reference to the correct Ubuntu 20.04 LTS Gen2
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  tags = {
    project     = "vr89project"
    environment = "dev"
    owner       = "vr89"
  }
}

# Define a Custom Script Extension for the VM
resource "azurerm_virtual_machine_extension" "custom_script" {
  name                 = "install-app"
  virtual_machine_id   = azurerm_linux_virtual_machine.matebox.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  settings = <<SETTINGS
  {
    "commandToExecute": "sh /var/lib/waagent/custom-script/download/0/install-app.sh"
  }
  SETTINGS

  depends_on = [azurerm_linux_virtual_machine.matebox]

  tags = {
    project     = "vr89project"
    environment = "dev"
    owner       = "vr89"
  }
}
