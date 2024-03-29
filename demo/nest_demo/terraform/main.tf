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


module "custom-roles" {
  source = "terraform-google-modules/iam/google//modules/custom_role_iam"

  for_each             = var.service_account_roles
  target_level         = "project"
  target_id            = var.project
  role_id              = each.key
  title                = each.value.title
  description          = each.value.description
  base_roles           = []
  permissions          = each.value.permissions
  excluded_permissions = each.value.excluded_permissions
  members              = []
}

module "service_account-iam-bindings" {
  source = "terraform-google-modules/iam/google//modules/service_accounts_iam"
  depends_on   = [module.service_accounts]
  for_each = {
        for key, val in var.service_accounts :
        key => val if length(val.service_accounts_binding) > 0
  }
  service_accounts = [module.service_accounts[each.key].email]
  project          = var.project
  mode             = "additive"
  bindings = each.value.service_account_iam_binding
}