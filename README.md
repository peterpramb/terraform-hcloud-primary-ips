[![License](https://img.shields.io/github/license/peterpramb/terraform-hcloud-primary-ips)](https://github.com/peterpramb/terraform-hcloud-primary-ips/blob/master/LICENSE)
[![Latest Release](https://img.shields.io/github/v/release/peterpramb/terraform-hcloud-primary-ips?sort=semver)](https://github.com/peterpramb/terraform-hcloud-primary-ips/releases/latest)
[![Terraform Version](https://img.shields.io/badge/terraform-%E2%89%A5%200.13.0-623ce4)](https://www.terraform.io)


# terraform-hcloud-primary-ips

[Terraform](https://www.terraform.io) module for managing primary IPs in the [Hetzner Cloud](https://www.hetzner.com/cloud).

It implements the following [provider](#providers) resources:

- [hcloud\_primary\_ip](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/primary_ip)


## Usage

```terraform
module "primary_ip" {
  source      = "github.com/peterpramb/terraform-hcloud-primary-ips?ref=<release>"

  primary_ips = [
    {
      name       = "server-1:ipv4"
      datacenter = "nbg1-dc3"
      target     = "server"
      type       = "ipv4"
      protection = true
      labels     = {
        "managed"    = "true"
        "managed_by" = "Terraform"
      }
    },
    {
      name       = "server-1:ipv6"
      datacenter = "nbg1-dc3"
      target     = "server"
      type       = "ipv6"
      protection = true
      labels     = {
        "managed"    = "true"
        "managed_by" = "Terraform"
      }
    }
  ]
}
```


## Requirements

| Name | Version |
|------|---------|
| [terraform](https://www.terraform.io) | &ge; 0.13 |


## Providers

| Name | Version |
|------|---------|
| [hcloud](https://registry.terraform.io/providers/hetznercloud/hcloud) | &ge; 1.35 |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-------:|:--------:|
| primary\_ips | List of primary IP objects to be managed. | list(map([*primary\_ip*](#primary_ip))) | See [below](#defaults) | yes |


#### *primary\_ip*

| Name | Description | Type | Required |
|------|-------------|:----:|:--------:|
| [name](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/primary_ip#name) | Unique name of the primary IP. | string | yes |
| [datacenter](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/primary_ip#datacenter) | Name of the datacenter to create the primary IP in. | string | yes |
| [target](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/primary_ip#assignee_type) | Target type of the primary IP. | string | yes |
| [type](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/primary_ip#type) | Address type of the primary IP. | string | yes |
| [protection](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/primary_ip#delete_protection) | Protect primary IP from deletion. | bool | no |
| [labels](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/primary_ip#labels) | Map of user-defined labels. | map(string) | no |


### Defaults

```terraform
primary_ips = [
  {
    name       = "primary_ip-1"
    datacenter = "nbg1-dc3"
    target     = "server"
    type       = "ipv4"
    protection = false
    labels     = {}
  }
]
```


## Outputs

| Name | Description |
|------|-------------|
| primary\_ips | List of all primary IP objects. |
| primary\_ip\_ids | Map of all primary IP objects indexed by ID. |
| primary\_ip\_names | Map of all primary IP objects indexed by name. |


### Defaults

```terraform
primary_ips = [
  {
    "assignee_id" = 0
    "assignee_type" = "server"
    "auto_delete" = false
    "datacenter" = "nbg1-dc3"
    "delete_protection" = false
    "id" = "11011913"
    "ip_address" = "192.0.2.1"
    "labels" = {}
    "name" = "primary_ip-1"
    "type" = "ipv4"
  },
]

primary_ip_ids = {
  "11011913" = {
    "assignee_id" = 0
    "assignee_type" = "server"
    "auto_delete" = false
    "datacenter" = "nbg1-dc3"
    "delete_protection" = false
    "id" = "11011913"
    "ip_address" = "192.0.2.1"
    "labels" = {}
    "name" = "primary_ip-1"
    "type" = "ipv4"
  }
}

primary_ip_names = {
  "primary_ip-1" = {
    "assignee_id" = 0
    "assignee_type" = "server"
    "auto_delete" = false
    "datacenter" = "nbg1-dc3"
    "delete_protection" = false
    "id" = "11011913"
    "ip_address" = "192.0.2.1"
    "labels" = {}
    "name" = "primary_ip-1"
    "type" = "ipv4"
  }
}
```


## License

This module is released under the [MIT](https://github.com/peterpramb/terraform-hcloud-primary-ips/blob/master/LICENSE) License.
