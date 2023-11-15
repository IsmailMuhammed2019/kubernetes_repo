provider "aws" {
  region = "us-east-1"
  # access_key = ""
  # secret_key = ""
}

resource "aws_instance" "firstinstance" {
  ami                    = "ami-0fc5d935ebf8bc3bc"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  key_name               = "terra-key"
  vpc_security_group_ids = ["sg-0b51aca4a62a291f6"]
  tags = {
    Name = "Terra-Instance"
    Project = "Ismail"
  }
}