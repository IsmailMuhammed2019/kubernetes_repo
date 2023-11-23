resource "aws_vpc" "tretenvpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "treten"
  }
}

resource "aws_subnet" "treten-pub-1" {
  vpc_id                  = aws_vpc.tretenvpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1

  tags = {
    Name = "treten-pub-1"
  }
}

resource "aws_subnet" "treten-pub-2" {
  vpc_id                  = aws_vpc.tretenvpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2

  tags = {
    Name = "treten-pub-2"
  }
}

resource "aws_subnet" "treten-pub-3" {
  vpc_id                  = aws_vpc.tretenvpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3

  tags = {
    Name = "treten-pub-3"
  }
}

resource "aws_subnet" "treten-priv-1" {
  vpc_id                  = aws_vpc.tretenvpc.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1

  tags = {
    Name = "treten-priv-1"
  }
}

resource "aws_subnet" "treten-priv-2" {
  vpc_id                  = aws_vpc.tretenvpc.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2

  tags = {
    Name = "treten-priv-2"
  }
}

resource "aws_subnet" "treten-priv-3" {
  vpc_id                  = aws_vpc.tretenvpc.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3

  tags = {
    Name = "treten-priv-3"
  }
}

resource "aws_internet_gateway" "treten-IGW" {
  vpc_id = aws_vpc.tretenvpc.id

  tags = {
    Name = "treten-IGW"
  }
}

resource "aws_route_table" "treten-pub-RT" {
  vpc_id = aws_vpc.tretenvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.treten-IGW.id
  }

  tags = {
    Name = "treten-pub-RT"
  }
}

resource "aws_route_table_association" "treten-pub-1-a" {
  subnet_id      = aws_subnet.treten-pub-1.id
  route_table_id = aws_route_table.treten-pub-RT.id
}

resource "aws_route_table_association" "treten-pub-2-a" {
  subnet_id      = aws_subnet.treten-pub-2.id
  route_table_id = aws_route_table.treten-pub-RT.id
}

resource "aws_route_table_association" "treten-pub-3-a" {
  subnet_id      = aws_subnet.treten-pub-3.id
  route_table_id = aws_route_table.treten-pub-RT.id
}