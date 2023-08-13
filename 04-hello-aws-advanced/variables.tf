# Terraform variables are used to parameterize your configuration.

variable "ec2_name" {
  description = "value for the Name tag of the EC2 instance"
  type        = string
  default     = "aws-instance"
}

variable "app_name" {
  description = "value for the Application tag of the EC2 instance"
  type        = string
  default     = "myapp"
}

variable "env_name" {
  description = "value for the Environment tag of the EC2 instance"
  type        = string
  default     = "dev"
}

variable "username" {
  description = "username for the EC2 instance"
  type        = string
  default     = "Jon Snow"
}