output "igw-name" {
  value = aws_internet_gateway.igw.tags["Name"]
}