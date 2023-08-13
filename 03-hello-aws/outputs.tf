# Outputs
#####################
# This data is outputted when apply is called,
# and can be queried using the terraform output command.
# https://www.terraform.io/docs/commands/output.html

output "name" {
  value = aws_instance.example_instance.tags.Name
}

output "public_ip" {
  value = aws_instance.example_instance.public_ip
}

output "instance_id" {
  value = aws_instance.example_instance.id
}
