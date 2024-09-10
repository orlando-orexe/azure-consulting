variable "docker_image" {
    type = string
}

variable "docker_tag" {
    type = string
}

variable "env_prefix" {
  type = string
}

variable "reource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "project" {
  type    = string
  default = "almonds-next"
}

variable "sku_name" {
  type    = string
  default = "P1v2"
}

variable "subnet_id" {
  type = string
}

variable "network_id" {
  type = string
}