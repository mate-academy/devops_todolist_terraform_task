locals {
  dns_label = "${var.net_pubip_dns_prefix}-${random_integer.dns.result}"
}
