variable "compartment_id" {
  description = "OCID of the compartment in which to create the bastion."
  type        = string
}

variable "name" {
  description = "Name of the bastion (unique within the compartment)."
  type        = string
}

variable "target_subnet_id" {
  description = "OCID of the subnet the bastion routes sessions into."
  type        = string
}

variable "client_cidr_block_allow_list" {
  description = "List of CIDR blocks allowed to connect to sessions on this bastion."
  type        = list(string)
  default     = ["0.0.0.0/0"]

  validation {
    condition     = length(var.client_cidr_block_allow_list) > 0
    error_message = "At least one client CIDR block must be provided."
  }
}

variable "max_session_ttl_in_seconds" {
  description = "Maximum time-to-live for sessions created on the bastion, in seconds (1800-10800)."
  type        = number
  default     = 10800

  validation {
    condition     = var.max_session_ttl_in_seconds >= 1800 && var.max_session_ttl_in_seconds <= 10800
    error_message = "max_session_ttl_in_seconds must be between 1800 and 10800."
  }
}

variable "freeform_tags" {
  description = "Free-form tags applied to the bastion."
  type        = map(string)
  default     = {}
}

variable "defined_tags" {
  description = "Defined tags applied to the bastion, keyed as \"namespace.key\"."
  type        = map(string)
  default     = {}
}
