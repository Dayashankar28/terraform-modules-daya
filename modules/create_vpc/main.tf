resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "tf-vpc"
  }
}


// Create Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

   tags = {
    Name = "tf-igw"
  }
}

// Create Subnet-1 // that should be public

resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.4.1.0/24"

  tags = {
    Name = "public_subnet_1"
  }
}

// Create Subnet-1 // that should be private

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.4.2.0/24"

  tags = {
    Name = "private_subnet_1"
  }
}

// Create route table for public subnet

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
      Name = "public-rt"
  }

}

// Create route table for public subnet

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.main.id

    tags = {
      Name = "private-rt"
  }


  # route {
  #   cidr_block = "0.0.0.0/0"
  #   gateway_id = aws_internet_gateway.igw.id
  # }
  
}


// Associate the Public Subnet with the Public Route Table

resource "aws_route_table_association" "public_associaation" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public-rt.id
}


// Associate the Private Subnet with the Private Route Table

resource "aws_route_table_association" "private_associaation" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private-rt.id
}


