variable "REGION" {
  default = "us-west-2"
}

variable "ZONE1" {
  default = "us-east-1b"
}

variable "ZONE2" {
  default = "us-west-2b"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-0230bd60aa48260c6"
    us-west-2 = "ami-093467ec28ae4fe03"
  }
}

variable "USER" {
  default = "ec2-user"
}