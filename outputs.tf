output "id" {
  description = "OCID of the bastion."
  value       = oci_bastion_bastion.this.id
}

output "name" {
  description = "Name of the bastion."
  value       = oci_bastion_bastion.this.name
}

output "private_endpoint_ip_address" {
  description = "Private IP address of the bastion's endpoint in the target subnet."
  value       = oci_bastion_bastion.this.private_endpoint_ip_address
}

output "state" {
  description = "Lifecycle state of the bastion."
  value       = oci_bastion_bastion.this.state
}
