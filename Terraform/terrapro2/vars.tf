variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-0fc5d935ebf8bc3bc"
    us-west-2 = "ami-0efcece6bed30fd98"
  }
}