# terraform-oci-bastion

Terraform module that manages an [Oracle Cloud Infrastructure](https://www.oracle.com/cloud/)
Bastion, giving secure, time-bound SSH access to private resources without exposing them to
the public internet. Individual sessions are created separately against this bastion.

## Usage

```hcl
module "bastion" {
  source = "github.com/moveeeax/terraform-oci-bastion"

  compartment_id   = var.compartment_id
  name             = "prod-bastion"
  target_subnet_id = var.private_subnet_id

  client_cidr_block_allow_list = ["203.0.113.0/24"]

  freeform_tags = {
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
```

A runnable example lives in [`examples/basic`](examples/basic).

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5   |
| oci       | >= 5.0   |

## Inputs

| Name                           | Description                                                     | Type           | Default           | Required |
|--------------------------------|-----------------------------------------------------------------|----------------|-------------------|:--------:|
| `compartment_id`               | OCID of the compartment in which to create the bastion.         | `string`       | n/a               |   yes    |
| `name`                         | Name of the bastion (unique within the compartment).           | `string`       | n/a               |   yes    |
| `target_subnet_id`             | OCID of the subnet the bastion routes sessions into.           | `string`       | n/a               |   yes    |
| `client_cidr_block_allow_list` | CIDR blocks allowed to connect to sessions.                    | `list(string)` | `["0.0.0.0/0"]`   |    no    |
| `max_session_ttl_in_seconds`   | Maximum session TTL in seconds (1800-10800).                   | `number`       | `10800`           |    no    |
| `freeform_tags`                | Free-form tags applied to the bastion.                         | `map(string)`  | `{}`              |    no    |
| `defined_tags`                 | Defined tags applied to the bastion, keyed `namespace.key`.     | `map(string)`  | `{}`              |    no    |

## Outputs

| Name                          | Description                                        |
|-------------------------------|----------------------------------------------------|
| `id`                          | OCID of the bastion.                               |
| `name`                        | Name of the bastion.                               |
| `private_endpoint_ip_address` | Private IP of the bastion endpoint.                |
| `state`                       | Lifecycle state of the bastion.                    |

## License

[MIT](LICENSE)
