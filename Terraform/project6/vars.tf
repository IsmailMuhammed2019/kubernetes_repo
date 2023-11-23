variable "REGION" {
  default = "us-east-1"
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

variable "ZONE1" {
  default = "us-east-1a"
}

variable "ZONE2" {
  default = "us-east-1b"
}

variable "ZONE3" {
  default = "us-east-1c"
}

variable "MYIP" {
  default = "102.67.11.38/32"
}