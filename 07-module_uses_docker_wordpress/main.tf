module "wordpress" {
    source = "../06-docker-wordpress"

    mysql_root_password = "password"
}

# show output from module wordpress
output "wordpress_ip" {
    value = module.wordpress.wordpress_logs
}
