# Terraform configuration file
#
# Provider configuration
provider "aws" {
  region = "us-east-2"
}


# Resource configuration
# Resource blocks are used to define resources in Terraform.
# A resource block declares a resource of a given type ("aws_instance" in this case)
# with a given local name ("example_instance" in this case).

resource "aws_security_group" "example_sg" {
  name        = "example-sg"
  description = "Example security group"
}

resource "aws_instance" "example_instance" {
  ami           = "ami-0ccabb5f82d4c9af5"  # Amazon Linux 2023 AMI
  instance_type = "t2.micro"
  tags = {
    Name = var.ec2_name
  }
  security_groups = [aws_security_group.example_sg.name]
}