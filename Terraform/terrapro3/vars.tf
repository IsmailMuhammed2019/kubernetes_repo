variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1b"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-0fc5d935ebf8bc3bc"
    us-west-1 = "ami-06e4ca05d431835e9"
  }
}

variable "USER" {
  default = "ec2-user"
}