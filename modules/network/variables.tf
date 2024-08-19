variable "net_resource_group_name" {
  description = (
    <<EOF
      Required for input during module import
        suggests you have created a resource group elsewhere
      EOF
  )
  type = string
}

variable "net_location" {
  description = (
    <<EOF
      Required for input during module import
        suggests you have created a resource group elsewhere
      EOF
  )
  type = string
}

variable "net_vnet_name" {
  description = (
    <<EOF
      Required for input during module import
        make sure name is unique among the resource group
      EOF
  )
  type = string
  validation {
    condition = (
      length(var.net_vnet_name) >= 1 && length(var.net_vnet_name) <= 80 &&
      can(regex("^[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9_]$", var.net_vnet_name)) &&
      !can(regex("(--|__|\\.{2,})", var.net_vnet_name))
    )
    error_message = (
      <<EOF
        The name must be 1-80 characters long;
        start with a letter or number;
        contain only letters, numbers, underscores, periods, or hyphens;
        no "--", "__", ".." allowed;
        end with a letter, number, or underscore.
      EOF
    )
  }
}

variable "net_vnet_address_space" {
  description = (
    <<EOF
      Optional for input during module import

      Default value is [ "10.0.0.0/16" ]
      EOF
  )
  type    = list(string)
  default = ["10.0.0.0/16"]
  validation {
    condition = (
      length(var.net_vnet_address_space) > 0 &&
      alltrue([
        for cidr in var.net_vnet_address_space :
        can(regex(
          format(
            "^%s\\.%s\\.%s\\.%s/%s$",
            // Match the first octet
            "(25[0-5]|2[0-4][0-9]|[0-1]?[0-9][0-9]?)",
            // Match the second octet
            "(25[0-5]|2[0-4][0-9]|[0-1]?[0-9][0-9]?)",
            // Match the third octet
            "(25[0-5]|2[0-4][0-9]|[0-1]?[0-9][0-9]?)",
            // Match the fourth octet
            "(25[0-5]|2[0-4][0-9]|[0-1]?[0-9][0-9]?)",
            // Match the CIDR prefix
            "([0-9]|[1-2][0-9]|3[0-2])"
          ),
          cidr
        ))
      ])
    )
    error_message = (
      <<EOF
        Each element in 'vnet_address_space' must be a valid CIDR block (e.g., "10.0.0.0/16").
        The list cannot be empty,
        each CIDR must be correctly formatted with IP addresses between 0.0.0.0 and 255.255.255.255
        prefix between 0 and 32.
      EOF
    )
  }
}

variable "net_subnet_name" {
  description = (
    <<EOF
      Optional for input during module import

      Default value is "default"
      EOF
  )
  type    = string
  default = "default"
  validation {
    condition = (
      length(var.net_subnet_name) >= 1 && length(var.net_subnet_name) <= 80 &&
      can(regex("^[a-zA-Z0-9]([a-zA-Z0-9-]*[a-zA-Z0-9])?$", var.net_subnet_name)) &&
      !can(regex("--", var.net_subnet_name))
    )
    error_message = (
      <<EOF
        The subnet name must be 1-80 characters long;
        start with a letter or number;
        contain only letters, numbers, or hyphens;
        no consecutive hyphens allowed;
        end with a letter or number.
      EOF
    )
  }
}

variable "net_subnet_address_prefixes" {
  description = (
    <<EOF
      Optional for input during module import

      Default value is [ "10.0.0.0/24" ]
      EOF
  )
  type    = list(string)
  default = ["10.0.0.0/24"]
  validation {
    condition = (
      length(var.net_subnet_address_prefixes) > 0 &&
      alltrue([
        for cidr in var.net_subnet_address_prefixes :
        can(regex(
          format(
            "^%s\\.%s\\.%s\\.%s/%s$",
            // Match the first octet
            "(25[0-5]|2[0-4][0-9]|[0-1]?[0-9][0-9]?)",
            // Match the second octet
            "(25[0-5]|2[0-4][0-9]|[0-1]?[0-9][0-9]?)",
            // Match the third octet
            "(25[0-5]|2[0-4][0-9]|[0-1]?[0-9][0-9]?)",
            // Match the fourth octet
            "(25[0-5]|2[0-4][0-9]|[0-1]?[0-9][0-9]?)",
            // Match the CIDR prefix
            "([0-9]|[1-2][0-9]|3[0-2])"
          ),
          cidr
        ))
      ])
    )
    error_message = (
      <<EOF
        Each element in 'subnet_address_prefixes' must be a valid CIDR block (e.g., "10.0.0.0/16").
        The list cannot be empty,
        each CIDR must be correctly formatted with IP addresses between 0.0.0.0 and 255.255.255.255
        prefix between 0 and 32.
      EOF
    )
  }
}

variable "net_nsg_name" {
  description = (
    <<EOF
      Required for input during module import
        make sure name is unique among the resource group
      EOF
  )
  type = string
  validation {
    condition = (
      length(var.net_nsg_name) >= 2 && length(var.net_nsg_name) <= 64 &&
      can(regex("^[a-zA-Z0-9]([a-zA-Z0-9._-]*[a-zA-Z0-9_])?$", var.net_nsg_name)) &&
      !can(regex("(--|__|\\.{2,})", var.net_nsg_name))
    )
    error_message = (
      <<EOF
        The subnet name must be 2-64 characters long;
        start with a letter or number;
        contain only letters, numbers, hyphens, underscores and periods;
        no "--", "__", ".." allowed;
        end with a letter, number or underscore.
      EOF
    )
  }
}

variable "net_security_rules" {
  description = (
    <<EOF
      Optional for input during module import

      Default Value is <standard set of rules for enabling access
                        to websites via HTTP and HTTPS>
      To remove the rules set it "[]"
      Additional configs memo:
        {
          name                       = "allow-ssh"
          priority                   = range 100 - 4096
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          source_port_range          = "*"
          destination_port_range     = "22"
          source_address_prefix      = "*"
          destination_address_prefix = "*"
        }
      EOF
  )
  type = list(object({
    name                       = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
    access                     = string
    priority                   = number
    direction                  = string
  }))
  default = [
    {
      name                       = "Allow-HTTP"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      access                     = "Allow"
      priority                   = 101
      direction                  = "Inbound"
    },
    {
      name                       = "Allow-HTTPS"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      access                     = "Allow"
      priority                   = 102
      direction                  = "Inbound"
    }
  ]
}

variable "net_pubip_name" {
  description = (
    <<EOF
    Required for input during module import
      Public Ip Name
    EOF
  )
  type = string
  validation {
    condition = (
      length(var.net_pubip_name) >= 1 && length(var.net_pubip_name) <= 80 &&
      can(regex("^[a-zA-Z0-9]([a-zA-Z0-9._-]*[a-zA-Z0-9_])?$", var.net_pubip_name)) &&
      !can(regex("(--|__|\\.{2,})", var.net_pubip_name))
    )
    error_message = (
      <<EOF
        The public ip name must be 1-80 characters long;
        start with a letter or number;
        contain only letters, numbers, hyphens, underscores and periods;
        no "--", "__", ".." allowed;
        end with a letter, number or underscore.
      EOF
    )
  }
}

variable "net_pubip_dns_prefix" {
  description = (
    <<EOF
    Required for input during module import
      DNS label will be constructed in following format:
      <dns_prefix>-<random ***** number>
    EOF
  )
  type = string
  validation {
    condition = (
      length(var.net_pubip_dns_prefix) >= 4 && length(var.net_pubip_dns_prefix) <= 59 &&
      can(regex("^[a-zA-Z0-9]([a-zA-Z0-9-]*[a-zA-Z0-9])?$", var.net_pubip_dns_prefix)) &&
      !can(regex("--", var.net_pubip_dns_prefix))
    )
    error_message = (
      <<EOF
        The dns_prefix must be 4-59 characters long;
        start with a letter or number;
        contain only letters, numbers and hyphens;
        no "--" allowed;
        end with a letter & number
      EOF
    )
  }
}

variable "net_pubip_sku" {
  description = (
    <<EOF
    Optional for input during module import
      bound with allocation method, possible combinations:
        | SKU    | Allocation
      - Basic    - Dynamic
      - Standard - Dynamic
      - Standard - Static

    Default value is "Basic"
    EOF
  )
  type    = string
  default = "Basic"
  validation {
    condition     = contains(["Basic", "Standard"], var.net_pubip_sku)
    error_message = "The SKU must be either 'Basic' or 'Standard'."
  }
}

variable "net_pubip_allocation_method" {
  description = (
    <<EOF
    Optional for input during module import
      bound with allocation method, possible combinations:
        | SKU    | Allocation
      - Basic    - Dynamic
      - Standard - Dynamic
      - Standard - Static

    Default value is "Dynamic"
    EOF
  )
  type    = string
  default = "Dynamic"
  validation {
    condition     = contains(["Dynamic", "Static"], var.net_pubip_allocation_method)
    error_message = "The Allocation metthod must be either 'Dynamic' or 'Static'."
  }
}
