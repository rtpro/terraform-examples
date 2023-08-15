# Outputs
######################
output "wordpress_logs" {
  value = data.docker_logs.wordpress.logs_list_string
}
output "database_logs" {
  value = data.docker_logs.mysql.logs_list_string
}
