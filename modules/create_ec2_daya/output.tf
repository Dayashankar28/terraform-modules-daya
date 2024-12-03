output "ami_id" {
  value = data.aws_ami.ubuntu.id
}

output "security_groups" {
    value = data.aws_security_group.default.name
  
}