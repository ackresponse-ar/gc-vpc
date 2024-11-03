terraform {
  backend "gcs" {
    bucket = "ar-tf-vpc-state"
    prefix = "terraform/vpc/state"
  }
}