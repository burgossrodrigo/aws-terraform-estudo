terraform {
  backend "s3" {
    bucket  = "bia-terraform-rodrigo"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    profile = "bia"
  }
}