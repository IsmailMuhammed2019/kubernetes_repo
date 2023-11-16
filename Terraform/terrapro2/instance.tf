resource "aws_instance" "project2" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "kops-key"
  vpc_security_group_ids = ["sg-0b51aca4a62a291f6"]
  tags = {
    Name = "Project2"
  }
}