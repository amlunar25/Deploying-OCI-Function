terraform {
  required_providers {
    oci = {
      source = "oracle/oci"
    }
  }
}

provider "oci" {
  region              = var.region
  auth                = var.auth
  config_file_profile = var.config_file_profile
}


resource "oci_functions_function" "terr_test1" {
  application_id = "ocid1.fnapp.oc1.iad.aaaaaaaa7njngsat64tp6hxwszkwzb7t7qvxwmp5pue6lpormfopvzwthw6a"
  display_name   = var.application_name
  image          = "iad.ocir.io/id64xepqbqwr/${var.repository_name}/${var.application_name}:latest"
  memory_in_mbs  = "256"
}