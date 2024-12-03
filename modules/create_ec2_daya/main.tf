data "aws_ami" "ubuntu" {
  owners = ["099720109477"]
  most_recent = true
  
  filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20240801"]
    }

}

data "aws_security_group" "default" {
  id = "sg-05e0eb7b7e1f52034"
}


resource "aws_instance" "create_ec2" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = [data.aws_security_group.default.name]

  tags = {
    Name = "tf-example"
  }

}