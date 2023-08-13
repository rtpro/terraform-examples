# Outputs
#####################
# This data is outputted when apply is called,
# and can be queried using the terraform output command.
# https://www.terraform.io/docs/commands/output.html

output "name" {
  value = aws_instance.app_instance.tags.Name
}

output "public_ip" {
  value = aws_instance.app_instance.public_ip
}

output "instance_id" {
  value = aws_instance.app_instance.id
}

# output "virtual_machine_id" {
#   value = data.aws_availability_zones.available.names
# }