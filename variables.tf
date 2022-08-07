# =======================================
# Manage primary IPs in the Hetzner Cloud
# =======================================


# ---------------
# Input Variables
# ---------------

variable "primary_ips" {
  description = "The list of primary IP objects to be managed. Each primary IP object supports the following parameters: 'name' (string, required), 'datacenter' (string, required), 'target' (string, required), 'type' (string, required), 'protection' (bool, optional), 'labels' (map of KV pairs, optional)."

  type        = list(
    object({
      name       = string
      datacenter = string
      target     = string
      type       = string
      protection = bool
      labels     = map(string)
    })
  )

  default     = [
    {
      name       = "primary_ip-1"
      datacenter = "nbg1-dc3"
      target     = "server"
      type       = "ipv4"
      protection = false
      labels     = {}
    }
  ]

  validation {
    condition     = can([
      for primary_ip in var.primary_ips : regex("\\w+", primary_ip.name)
    ])
    error_message = "All primary IPs must have a valid 'name' attribute specified."
  }

  validation {
    condition     = can([
      for primary_ip in var.primary_ips : regex("\\w+", primary_ip.datacenter)
    ])
    error_message = "All primary IPs must have a valid 'datacenter' attribute specified."
  }

  validation {
    condition     = can([
      for primary_ip in var.primary_ips : regex("\\w+", primary_ip.target)
    ])
    error_message = "All primary IPs must have a valid 'target' attribute specified."
  }

  validation {
    condition     = can([
      for primary_ip in var.primary_ips : regex("\\w+", primary_ip.type)
    ])
    error_message = "All primary IPs must have a valid 'type' attribute specified."
  }
}
