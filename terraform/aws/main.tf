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


# Linux Instance
# Ubuntu Server 24.04 LTS (HVM), SSD Volume Type

# ami-0ea3c35c5c3284d82 (64-bit (x86)) / ami-01ebf7c0e446f85f9 (64-bit (Arm))

resource "aws_instance" "linux_vm" {
  ami           = "ami-0ea3c35c5c3284d82" # Ubuntu Server 24.04 LTS (HVM), SSD Volume Type

  instance_type = "t3.micro" # Use a free tier eligible instance type

  key_name      = aws_key_pair.deployer.key_name

  tags = {
    Name = "SysInfoLinuxVM"
  }

# Attach security group to instance
  vpc_security_group_ids =[aws_security_group.allow_ssh.id]
}
