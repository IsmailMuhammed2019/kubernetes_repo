<<<<<<< HEAD:Terraform/terrapro3/instance.tf
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("newkey.pub")
}

resource "aws_instance" "websetup" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = ["sg-0268673e6e1ed12ad"]
  tags = {
    Name = "websetup"
  }

  provisioner "file" {
    source      = "app.sh"
    destination = "/tmp/app.sh"
  }

  provisioner "remote-exec" {

    inline = [
      "chmod u+x /tmp/app.sh",
      "sudo /tmp/app.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("newkey")
    host        = self.public_ip
  }

}

=======
resource "aws_key_pair" "ubuntu-key" {
  key_name   = "ubuntu-key"
  public_key = file("ubuntukey.pub")
}

resource "aws_instance" "webtemplate" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.ubuntu-key.key_name
  vpc_security_group_ids = ["sg-0268673e6e1ed12ad"]
  tags = {
    Name = "webtemplate"
  }

  provisioner "file" {
    source      = "app.sh"
    destination = "/tmp/app.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/app.sh",
      "sudo /tmp/app.sh",
    ]
  }

  connection {
    user        = var.USER
    private_key = file("ubuntukey")
    host        = self.public_ip
  }
}
>>>>>>> ee26406dbde4872e921210844241bb8e62bd542f:Terraform/project3/instance.tf
