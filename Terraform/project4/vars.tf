variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1b"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-0230bd60aa48260c6"
  }
}

variable "USER" {
  default = "ec2-user"
}