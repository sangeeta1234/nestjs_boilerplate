variable "project" { 
    default = "speedy-precept-414205"
} 

variable "credentials_file" {
  default = "./creds.json"
}

variable "another_variable" {
  default = "some_value"
}




variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-c"
}

variable "services_to_enable" {
  type    = list(string)
  default =  [
    "cloudrun.googleapis.com", 
    ]
}

variable "enabled_services" {
  type    = list(string)
   default = [
    "cloudrun.googleapis.com", 
    ]
}

variable "service_accounts" {
  type = map(object({
    service_accounts_description     = string
    service_accounts_display_name    = string
    service_accounts_name            = list(string)
    service_account_prefix            = string
    role_key                          = string
    service_accounts_project_roles    = list(string)
    service_accounts_binding          = map(string)
  }))
  default = {
    sa_1 = {
      service_accounts_description     = "Api Service Account",
      service_accounts_display_name    = "Api Service Account",
      service_accounts_name            = ["speedy-test3"],
      service_account_prefix            = "sa",
      role_key                          = "api-service",
      service_accounts_project_roles    = [],
      service_accounts_binding          = {},
    },
    # Add more service account details as needed
  }
}

variable "service_account_roles" {
  type = map(object({
    title                  = string
    description            = string
    excluded_permissions   = list(string)
    permissions            = list(string)
  }))
  
  default = {
    "api-service" = {
      title                  = "Cloud Run"
      description            = "Cloud Run Api Service Account"
      excluded_permissions   = []
      permissions            = [
        "cloudsql.instances.get",
        "cloudsql.instances.list",
        "cloudsql.instances.create",
        "cloudsql.instances.update",
        "cloudsql.instances.delete",
        "cloudsql.databases.get",
        "cloudsql.databases.list",
        "cloudsql.databases.create",
        "cloudsql.databases.update",
        "cloudsql.databases.delete",
        "cloudsql.users.get",
        "cloudsql.users.list",
        "cloudsql.users.create",
        "cloudsql.users.update",
        "cloudsql.users.delete"
      ]
    }
    # Add more roles as needed
  }
}
 

