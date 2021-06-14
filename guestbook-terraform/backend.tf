/*
terraform {

  backend "gcs" {
    bucket = ""
    prefix = "project_maas/state"
  }

  required_providers {
    google = {
      version = "~> 3.53.0"
    }
  }
  required_providers {
    google-beta = {}
  }

}
*/
provider "google" {
  project = var.project
}
