resource "google_sql_database_instance" "my-database" {
  name             = "terraform-db"
  database_version = "POSTGRES_13"
  region           =  var.region

  settings {
    tier = "db-f1-micro"

    ip_configuration {
      ipv4_enabled = true
    }
  }
}


resource "google_sql_user" "user" {
  name     = "test_user"
  instance = google_sql_database_instance.my-database.name
  password = "VeryStrongPassword"
}

