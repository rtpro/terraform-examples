
# Provider block
#####################
provider "aws" {
  region = "us-east-2"
}

# Variables
#####################
variable "ec2_name_kuku" {
  description = "value for the Name tag of the EC2 instance"
  type        = string
  default     = "example-instance"
}


# Resources
#####################
resource "aws_security_group" "example_sg" {
  name        = "example-sg"
  description = "Example security group"
}

resource "aws_instance" "example_instance" {
  ami           = "ami-0ccabb5f82d4c9af5"  # Amazon Linux 2023 AMI
  instance_type = "t2.micro"
  tags = {
    Name = "${var.ec2_name_kuku}"
  }
  security_groups = [aws_security_group.example_sg.name]
}


