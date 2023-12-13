resource "aws_key_pair" "ubuntu-key" {
  key_name   = "ubuntu-key"
  public_key = file("ubuntukey.pub")
}

resource "aws_instance" "webtemplate" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE2
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


resource "null_resource" "save_output" {
  depends_on = [aws_instance.webtemplate]

  provisioner "local-exec" {
    command = <<-EOT
        echo '${aws_instance.webtemplate.public_ip}' >> output.txt
      EOT
  }

  provisioner "local-exec" {
    command = <<-EOT
        echo '${aws_instance.webtemplate.private_ip}' >> output.txt
      EOT
  }
}

output "PublicIP" {
  value = aws_instance.webtemplate.public_ip
}

output "PrivateIP" {
  value = aws_instance.webtemplate.private_ip
}