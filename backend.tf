terraform {
  backend "gcs" {
    bucket = "ar-tf-state-concept"
    prefix = "terraform/state"
  }
}