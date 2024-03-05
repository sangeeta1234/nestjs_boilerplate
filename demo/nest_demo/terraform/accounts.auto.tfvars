service_accounts = {
  "api-service" = {
    service_accounts_description     = "Api Service Account"
    service_accounts_display_name    = "Api Service Account"
    service_accounts_name            = ["my-speed-test"]
    service_account_prefix            = "sa"
    role_key                          = "api-service"
    service_accounts_project_roles    = []
    service_accounts_binding          = {}
  }
}

service_account_roles = {
  "api_service" = {
    title                      = "Cloud Run"
    description                = "Cloud Run Api Service Account"
    excluded_permissions       = []
    permissions = [
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
        "cloudsql.users.delete",

        #iam role
        "iam.roles.create",
        "iam.roles.delete",
        "iam.roles.get",
        "iam.roles.list",
    ]
  }
}