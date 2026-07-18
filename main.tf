resource "oci_bastion_bastion" "this" {
  compartment_id   = var.compartment_id
  name             = var.name
  bastion_type     = "STANDARD"
  target_subnet_id = var.target_subnet_id

  client_cidr_block_allow_list = var.client_cidr_block_allow_list
  max_session_ttl_in_seconds   = var.max_session_ttl_in_seconds

  freeform_tags = var.freeform_tags
  defined_tags  = var.defined_tags
}
