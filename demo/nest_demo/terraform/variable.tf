variable "project" { 
    default = "test"
} 

variable "credentials_file" {
  default = "./creds.json"
}

variable "another_variable" {
  default = "some_value"
}


variable "service_accounts" {
  description = "Map of service accounts with details."
  type        = map(object({
    name         = string
    display_name = string
  }))
  default = {
    sa_1 = {
      name         = "speedy-test2",
      display_name = "speedy-test2",
    },
    # Add more service account details as needed
  }
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



 

