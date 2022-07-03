# =======================================
# Manage primary IPs in the Hetzner Cloud
# =======================================


# ------------
# Local Values
# ------------

locals {
  # Build a map of all provided primary IP objects, indexed by primary IP name:
  primary_ips = {
    for primary_ip in var.primary_ips : primary_ip.name => primary_ip
  }
}


# -----------
# Primary IPs
# -----------

resource "hcloud_primary_ip" "primary_ips" {
  for_each          = local.primary_ips

  name              = each.value.name
  assignee_type     = each.value.target
  auto_delete       = false
  datacenter        = each.value.datacenter
  type              = each.value.type
  delete_protection = each.value.protection

  labels            = each.value.labels
}
