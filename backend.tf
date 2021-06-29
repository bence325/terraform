terraform {
  backend "s3" {
    bucket                  = "terraform-backend-bence325"
    key                     = "terraform.tfstate"
    region                  = "eu-central-1"
    shared_credentials_file = "~/.aws/credentials"
    profile                 = "codecool"
    dynamodb_table          = "terraform"
  }
}
