resource "aws_security_group" "treten-sg" {
  name        = "treten-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.tretenvpc.id

  ingress {
    description = "Allow only connection from my ip"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MYIP]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}