# Terraform variables are used to parameterize your configuration.

variable "ec2_name" {
  description = "value for the Name tag of the EC2 instance"
  type        = string
  default     = "example-instance"
}
