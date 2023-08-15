# Call module wordpress from 06-docker-wordpress local directory
module "wordpress" {
    source = "../06-docker-wordpress"

    mysql_root_password = "mypassword"
}

# show output from module wordpress
output "logs" {
    description = "The last logs from the Wordpress container"
    value = module.wordpress.wordpress_logs
}
