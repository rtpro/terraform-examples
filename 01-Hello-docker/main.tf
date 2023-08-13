terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

provider "aws" {
  region = "us-east-1"
}

resource "docker_image" "nginx_image_kuku" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx_my_app" {
  image = docker_image.nginx_image_kuku.image_id
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}

resource "docker_container" "nginx_my_app2" {
  image = docker_image.nginx_image_kuku.image_id
  name  = "tutorial2"
  ports {
    internal = 80
    external = 8001
  }
}

resource "docker_container" "nginx_kuku" {
  image = docker_image.nginx_image_kuku.image_id
  name  = "kuku"
  ports {
    internal = 80
    external = 8002
  }
}
