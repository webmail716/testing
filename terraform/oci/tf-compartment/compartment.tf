
resource "oci_identity_compartment" "tf-compartment" {
    # Required
    compartment_id = "ocid1.tenancy.oc1..aaaaaaaattxfaekw56ayn3zehgzdofvsjbhde3tvoex56saqrkuy2eckc6cq"
    description = "Compartment for Terraform resources."
    name = "my-compartment-name"
}