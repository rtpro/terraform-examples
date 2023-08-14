terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# Variables
######################
variable "mysql_root_password" {
  default = "password"
}

# Outputs
######################
output "wordpress_logs" {
  value = data.docker_logs.wordpress.logs_list_string
}

# Resources
######################
resource "docker_image" "mysql" {
  name         = "mysql:latest"
  keep_locally = false
}

resource "docker_image" "wordpress" {
  name         = "wordpress:latest"
  keep_locally = false
}

resource "docker_container" "mysql" {
  image = docker_image.mysql.image_id
  name  = "mysql"
  hostname = "mysql"
  env   = [
    "MYSQL_ROOT_PASSWORD=${var.mysql_root_password}",
    "MYSQL_DATABASE=wordpress",
  ]
  networks_advanced {
    name = "wordpress"
    aliases = ["wordpress"]
  }
  ports {
    internal = 3306
    external = 3306
  }
}

resource "docker_container" "wordpress" {
  image = docker_image.wordpress.image_id
  name  = "wordpress"
  networks_advanced {
    name = "wordpress"
    aliases = ["wordpress"]
  }
  ports {
    internal = 80
    external = 80
  }
  env = [
    "WORDPRESS_DB_HOST=${docker_container.mysql.name}",
    "WORDPRESS_DB_USER=root",
    "WORDPRESS_DB_PASSWORD=${var.mysql_root_password}",
    "WORDPRESS_DB_NAME=wordpress",
  ]
}

resource "docker_network" "wordpress" {
  name = "wordpress"
}

data "docker_logs" "wordpress" {
  name = docker_container.wordpress.name
}