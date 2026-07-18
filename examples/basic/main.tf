provider "oci" {}

module "bastion" {
  source = "../.."

  compartment_id   = var.compartment_id
  name             = "example-bastion"
  target_subnet_id = var.target_subnet_id

  client_cidr_block_allow_list = ["10.0.0.0/16"]

  freeform_tags = {
    Environment = "sandbox"
    ManagedBy   = "terraform"
  }
}

variable "compartment_id" {
  description = "Compartment OCID to deploy the example bastion into."
  type        = string
}

variable "target_subnet_id" {
  description = "OCID of the subnet the bastion routes sessions into."
  type        = string
}

output "bastion_id" {
  value = module.bastion.id
}
