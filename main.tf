terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.15.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}

resource "random_string" "random" {
    length = 4
    special = false
    upper = false
}

resource "docker_container" "nodered_container" {
  name  = join("-", ["nodered", random_string.random.result])
  image = docker_image.nodered_image.latest
  ports {
    internal = 1880
    external = 1880
  }
}

output "container_ip_address" {
  value = join(":", [docker_container.nodered_container.ip_address, docker_container.nodered_container.ports[0].external])
  description = "The ip address and external of the container"
}

output "container_name" {
  value = docker_container.nodered_container.name
  description = "The name of the container"
}