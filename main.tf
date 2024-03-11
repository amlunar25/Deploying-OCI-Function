terraform {
  required_providers {
    oci = {
      source = "oracle/oci"
    }
  }
}

provider "oci" {
  tenancy_ocid = "ocid1.tenancy.oc1..aaaaaaaa2brn6grgvs5rxmvrfdu22d72op2tuhw6da73lbjknr53slp6uh5q"
  user_ocid    = "ocid1.user.oc1..aaaaaaaa6wfolwse2lysoewtlvq6inbapyeqbjkqsizywrhtbgetxpmhh2oq"
  fingerprint  = "0f:b4:eb:77:f5:b8:00:57:b3:cc:1a:d4:c3:57:d0:a9"
  private_key  = "oci-local.pem"
  region       = var.region
}

resource "oci_functions_function" "terr_test1" {
  application_id = "ocid1.fnapp.oc1.iad.aaaaaaaa7njngsat64tp6hxwszkwzb7t7qvxwmp5pue6lpormfopvzwthw6a"
  display_name   = "terr-test1"
  image          = "iad.ocir.io/id64xepqbqwr/alex/terr-test1:latest"
  memory_in_mbs  = "256"
}

variable "region" {
  default = "us-ashburn-1"
}