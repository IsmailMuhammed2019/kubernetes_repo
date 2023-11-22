terraform {
  backend "s3" {
    bucket = "terraformstatefile1234"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}