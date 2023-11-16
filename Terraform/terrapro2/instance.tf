resource "aws_instance" "proterratest" {
    ami = var.AMIS[var.REGION]
    instance_type = "t2.micro"
    availability_zone = var.ZONE1
    key_name = "terra-key"
    vpc_security_group_ids = ["sg-0268673e6e1ed12ad"]
    tags = {
        Name = "project1"
    }
}
