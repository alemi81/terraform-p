terraform {
  backend "gcs" {
    bucket = "terraform-class-alemi81"
    prefix = "/dev/mnt/alemi81/project_infrastructure/0.account_setup"
  }
}