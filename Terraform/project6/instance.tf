resource "aws_key_pair" "ubuntu-key" {
  key_name   = "ubuntu-key"
  public_key = file("ubuntukey.pub")
}

resource "aws_instance" "webtemplate" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.treten-pub-1.id
  key_name               = aws_key_pair.ubuntu-key.key_name
  vpc_security_group_ids = [aws_security_group.treten-sg.id]
  tags = {
    Name = "webtemplate"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh",
    ]
  }

  connection {
    user        = var.USER
    private_key = file("ubuntukey")
    host        = self.public_ip
  }
}

resource "aws_ebs_volume" "treten-ebs" {
  availability_zone = var.ZONE1
  size              = 3

  tags = {
    Name = "treten-ebs"
  }
}

resource "aws_volume_attachment" "treten_ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.treten-ebs.id
  instance_id = aws_instance.webtemplate.id
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