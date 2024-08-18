variable "comp_resource_group_name" {
  description = (
    <<EOF
      Required for input during module import
        suggests you have created a resource group elsewhere
      EOF
  )
  type = string
}

variable "comp_location" {
  description = (
    <<EOF
      Required for input during module import
        suggests you have created a resource group elsewhere
      EOF
  )
  type = string
}

variable "comp_nic_ip_conf_name" {
  description = (
    <<EOF
      Required for input during module import
        make sure name is unique among the NIC
      EOF
  )
  validation {
    condition = (
      length(var.comp_nic_ip_conf_name) >= 1 && length(var.comp_nic_ip_conf_name) <= 80 &&
      can(regex("^[a-zA-Z0-9]([a-zA-Z0-9_.-]*[a-zA-Z0-9_])?$", var.comp_nic_ip_conf_name)) &&
      !can(regex("(--|__|\\.{2,})", var.comp_nic_ip_conf_name))
    )
    error_message = (
      <<EOF
        The ip configuration name must be 1-80 characters long;
        start with a letter or number;
        contain only letters, numbers, hyphens, underscores and periods;
        no "--", "__", ".." allowed;
        end with a letter, number or underscore.
      EOF
    )
  }
}

variable "comp_nic_subnet_id" {
  description = (
    <<EOF
      Required for input during module import
        suggests you have created a subnet within a VNet elsewhere
      EOF
  )
}

variable "comp_nic_private_ip_allocation" {
  description = (
    <<EOF
      Optional for input during module import
      - possible values: "Dynamic" or "Static"
      - make sure to set private static IP if you choose "Static"

      Default value is "Dynamic"
      EOF
  )
  type    = string
  default = "Dynamic"
  validation {
    condition     = contains(["Dynamic", "Static"], var.comp_nic_private_ip_allocation)
    error_message = "The allocation must be either 'Dynamic' or 'Static'."
  }
}

variable "comp_nic_private_static_ip" {
  description = (
    <<EOF
      Optional for input during module import
        The static private IP address.
          Only set if private Ip allocation is set to "Static"

      NIC will not use static private IP address by default.
      EOF
  )
  type    = string
  default = ""
  validation {
    condition = (
      var.comp_nic_private_ip_allocation == "Static" ?
      (var.comp_nic_private_static_ip != "" &&
        can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}$", var.comp_nic_private_static_ip)) &&
        alltrue([
          for octet in split("\\.", var.comp_nic_private_static_ip) :
          can(regex("^[0-9]{1,3}$", octet)) &&
          to_number(octet) >= 0 && to_number(octet) <= 255
        ])
      ) : (var.comp_nic_private_static_ip == "")
    )
    error_message = (
      <<EOF
        If 'nic_private_ip_allocation' is set to 'Static' ->
          'nic_private_static_ip' must be set & be a valid IPv4 address.
        If 'nic_private_ip_allocation' is set to 'Dynamic' ->
          'nic_private_static_ip' must not be set
        EOF
    )
  }
}

variable "comp_pubip_id" {
  description = (
    <<EOF
      Required for input during module import
        The ID of the public IP address to associate with the NIC:
          Suggests you have created a Public IP elsewhere
      EOF
  )
  type = string
}

variable "comp_vm_name" {
  description = (
    <<EOF
      Required for input during module import
        make sure name is unique among the resource group
      EOF
  )
  type = string
  validation {
    condition = (
      length(var.comp_vm_name) >= 1 && length(var.comp_vm_name) <= 60 &&
      can(regex("^[a-zA-Z0-9]([a-zA-Z0-9.-]*[a-zA-Z0-9])?$", var.comp_nic_ip_conf_name))
    )
    error_message = (
      <<EOF
        The ip virtual machine's name must be 1-60 characters long (to fit in NIC name);
        start with a letter or number;
        contain only letters, numbers, hyphens and periods;
        end with a letter or number.
      EOF
    )
  }
}

variable "comp_vm_size" {
  description = (
    <<EOF
      Required for input during module import
        To see full list of availabele VM sizes run in your region:
          using Cli:          az vm list-sizes --location <your region name> --output table
          using Powershell:   Get-AzVMSize -Location <your region name>
      EOF
  )
  type = string
}

variable "comp_vm_user_name" {
  description = "Required for input during module import"
  type        = string
  validation {
    condition = (
      length(var.comp_vm_user_name) >= 1 && length(var.comp_vm_user_name) <= 32 &&
      can(regex("^[a-z]([a-z0-9-]*[a-z0-9])?$", var.comp_vm_user_name)) &&
      !can(regex("--", var.comp_vm_user_name)) &&
      !contains([
        "root", "administrator", "admin", "sysadmin",
        "user", "user1", "guest", "test", "daemon", "nobody"
      ], var.comp_vm_user_name)
    )
    error_message = (
      <<EOF
        The username must be 1-32 characters long;
        start with a lowercase letter;
        contain only letters, numbers and hyphens;
        no "--" allowed;
        end with a letter or number;
        must not be similar to system user names
      EOF
    )
  }
}

variable "comp_vm_user_password" {
  description = "Required for input during module import"
  type        = string
  validation {
    condition = (
      length(var.comp_vm_user_password) >= 12 &&
      length(var.comp_vm_user_password) <= 123 &&
      can(regex("[A-Z]", var.comp_vm_user_password)) &&
      can(regex("[a-z]", var.comp_vm_user_password)) &&
      can(regex("[0-9]", var.comp_vm_user_password)) &&
      can(regex("[!@#$%^&*()\\-+=_\\.:,;/]", var.comp_vm_user_password))
    )
    error_message = (
      <<EOF
        The username must be 12-123 characters long;
        must unclude:
          Uppercase letters,
          Lowercase letters,
          Digits,
          Special characters, such as:
            ! @ # $ % ^ & * ( ) - + = _ . , : ; ? /
        must not contain username or vm_name
        Azure Api will reject simple passwords
      EOF
    )
  }
}

variable "comp_vm_os_disk_name" {
  description = (
    <<EOF
      Optional for input during module import
        make sure name is unique among the resource group

      Default value is "myosdisk1"
      EOF
  )
  type        = string
  default     = "myosdisk1"
  validation {
    condition = (
      length(var.comp_vm_os_disk_name) >= 1 && length(var.comp_vm_os_disk_name) <= 80 &&
      can(regex("^[a-z]([a-z0-9-]*[a-z0-9])?$", var.comp_vm_os_disk_name)) &&
      !can(regex("--", var.comp_vm_os_disk_name))
    )
    error_message = (
      <<EOF
        The os disk name must be 1 - 80 of length;
          start with a lowercase letter;
          can include lowercase letter, number or hyphens;
          end with a lowercase letter or number.
      EOF
    )
  }
}

variable "comp_vm_os_disk_size" {
  description = (
    <<EOF
      Optional for input during module import
        possible values range is 1 - 4096

      Default value is "64"
      EOF
  )
  type        = string
  default     = "64"
  validation {
    condition = (
      var.comp_vm_os_disk_size >= 1 &&
      var.comp_vm_os_disk_size <= 4096
    )
    error_message = (
      <<EOF
        The OS disk size must be a between 1 and 4096 GB.
      EOF
    )
  }
}

variable "comp_vm_os_disk_strg_acc_type" {
  description = (
    <<EOF
      Optional for input during module import
        possible values are:
          - Standard_LRS
          - StandardSSD_LRS
          - Premium_LRS
          - StandardSSD_ZRS
          - Premium_ZRS

      Default value is "Premium_LRS"
      EOF
  )
  type        = string
  default     = "Premium_LRS"
  validation {
    condition = (
      contains([
        "Standard_LRS", "StandardSSD_LRS", "Premium_LRS",
        "StandardSSD_ZRS ", "Premium_ZRS"
    ], var.comp_vm_os_disk_strg_acc_type))
    error_message = (
      <<EOF
        The OS disk storage account type must be one of the following:
          - Standard_LRS
          - StandardSSD_LRS
          - Premium_LRS
          - StandardSSD_ZRS
          - Premium_ZRS
      EOF
    )
  }
}

variable "comp_custom_script_url" {
  description = (
    <<EOF
      Required for input during module import
        This module is configured to use Custom Script extension
        to download and run single bash script file
      Please provide the link to the *.sh file
      EOF
  )
  type = string
}

variable "comp_custom_script_filename" {
  description = "enter the full file name here"
  type = string
}
