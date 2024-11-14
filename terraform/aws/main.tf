terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"  # Choose your desired region
}


# SSH Key Pair
resource "aws_key_pair" "deployer" {
  key_name   = "sysinfo-deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")  # Path to your public key
}

# Security group
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Attach security group to instance
# resource "aws_instance" "linux_vm" {
#   # ... previous configuration ...
#   vpc_security_group_ids =[aws_security_group.allow_ssh.id]
# }

# Linux Instance
# Ubuntu Server 24.04 LTS (HVM), SSD Volume Type

# ami-0ea3c35c5c3284d82 (64-bit (x86)) / ami-01ebf7c0e446f85f9 (64-bit (Arm))

resource "aws_instance" "linux_vm" {
  ami           = "ami-0ea3c35c5c3284d82" # Ubuntu Server 24.04 LTS (HVM), SSD Volume Type

  instance_type = "t2.micro" # Use a free tier eligible instance type

  key_name      = aws_key_pair.deployer.key_name

#  user_data = <<-EOF
#              #!/bin/bash
#              yum update -y
#              yum install -y ruby
#              gem install /path/to/sysinfo-1.0.gem
#              EOF

  tags = {
    Name = "SysInfoLinuxVM"
  }

  vpc_security_group_ids =[aws_security_group.allow_ssh.id]
}
