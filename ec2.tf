provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "kind_ec2" {
  ami           = "ami-0fc5d935ebf8bc3bc" 
  instance_type = "t3.medium"
  key_name      = "govind"

  vpc_security_group_ids = [
    aws_security_group.kind_sg.id
  ]

  tags = {
    Name = "kind-monitoring-lab"
  }
}
