<<<<<<< HEAD:Terraform/terrapro3/vars.tf
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
    us-west-1 = "ami-06e4ca05d431835e9"
  }
}

variable "USER" {
  default = "ec2-user"
=======
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
>>>>>>> ee26406dbde4872e921210844241bb8e62bd542f:Terraform/project3/vars.tf
}