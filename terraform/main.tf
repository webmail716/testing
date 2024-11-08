terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "4.0.0"  # Make sure to use the latest version
    }
  }
}

provider "oci" {
  tenancy_ocid = var.tenancy_ocid
  user_ocid    = var.user_ocid
  fingerprint  = var.fingerprint
  private_key_path = var.private_key_path
  region       = var.region
}

# Variables for SSH connection
variable "ssh_public_key" {
  type        = string
  description = "Public SSH key for Linux instance"
}


