locals {
  domain_name_label = var.dns_custom_label != null ? var.dns_custom_label : "${var.dns_label_prefix}-${random_integer.pip_dns.result}"
}