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


