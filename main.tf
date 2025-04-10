terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "flask_app" {
  name = "flask-app"
  build {
    context = "${path.module}/flask-app"
  }
}

resource "docker_container" "flask_app" {
  name  = "flask_app"
  image = docker_image.flask_app.name
  ports {
    internal = 5000
    external = 5000
  }
  links = [docker_container.redis.name]
}

resource "docker_image" "redis" {
  name = "redis:alpine"
}

resource "docker_container" "redis" {
  name  = "redis"
  image = docker_image.redis.name
  ports {
    internal = 6379
    external = 6379
  }
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx" {
  name  = "nginx"
  image = docker_image.nginx.name
  ports {
    internal = 80
    external = 8080
  }
}

resource "docker_image" "cadvisor" {
  name = "gcr.io/cadvisor/cadvisor:latest"
}

resource "docker_container" "cadvisor" {
  name  = "cadvisor"
  image = docker_image.cadvisor.name
  ports {
    internal = 8080
    external = 9090
  }
  volumes {
    host_path      = "/"
    container_path = "/rootfs"
    read_only      = true
  }
}
