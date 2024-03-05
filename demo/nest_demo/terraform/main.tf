terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
credentials = file(var.credentials_file)
 project = var.project
 region  = var.region
 zone    = var.zone
}

module "service_accounts" {
  source            = "terraform-google-modules/service-accounts/google"
  for_each          = var.service_accounts
  project_id        = var.project
  names         =  each.value.service_accounts_name 
  display_name      = each.value.service_accounts_display_name
  # Additional attributes as needed
}
