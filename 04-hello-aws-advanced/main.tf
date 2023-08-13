# Terraform configuration file
#
provider "aws" {
  region = "us-east-2"
}

resource "random_id" "server" {
  keepers = {
    # Generate a new ID only when a new instance is created
    #instance_id = aws_instance.app_instance.id
  }
  byte_length = 4
}

# Resource configuration
resource "aws_security_group" "example_sg" {
  name        = "example-sg"
  description = "Example security group"
}

resource "aws_instance" "app_instance" {
  ami           = "ami-0ccabb5f82d4c9af5"
  instance_type = local.instance_type
  user_data     = data.template_file.userdata.rendered
  tags = {
    Name        = "app-${var.ec2_name}-${random_id.server.hex}"
    environment = "${local.tags.environment}"
    application = "${local.tags.application}"
  }
  security_groups = [aws_security_group.example_sg.name]

}

# resource "aws_instance" "db_instance" {
#   ami           = "ami-0ccabb5f82d4c9af5"
#   instance_type = local.instance_type
#   tags = {
#     Name        = "db-${var.ec2_name}-${random_id.server.hex}"
#     environment = "${local.tags.environment}"
#     application = "${local.tags.application}"
#   }
#   security_groups = [aws_security_group.example_sg.name]
#   # count           = (local.tags.environment == "prod") ? 1 : 0
#   # depends_on      = [aws_instance.app_instance]
# }

locals {
  instance_type = "t2.micro"
  tags = {
    environment = "${var.env_name}"
    application = "${var.app_name}"
  }
}

data "template_file" "userdata" {
  template = file("${path.module}/userdata.sh")
  vars = {
    NAME             = var.username
  }
}

# data "aws_availability_zones" "available" {
#   state = "available"
# }