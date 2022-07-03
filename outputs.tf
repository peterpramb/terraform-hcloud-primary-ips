# =======================================
# Manage primary IPs in the Hetzner Cloud
# =======================================


# ------------
# Local Values
# ------------

locals {
  output_primary_ips = [
    for primary_ip in hcloud_primary_ip.primary_ips : primary_ip
  ]
}


# -------------
# Output Values
# -------------

output "primary_ips" {
  description = "A list of all primary IP objects."
  value       = local.output_primary_ips
}

output "primary_ip_ids" {
  description = "A map of all primary IP objects indexed by ID."
  value       = {
    for primary_ip in local.primary_ips : primary_ip.id => primary_ip
  }
}

output "primary_ip_names" {
  description = "A map of all primary IP objects indexed by name."
  value       = {
    for primary_ip in local.primary_ips : primary_ip.name => primary_ip
  }
}
