variable "env_prefix" {
  type = string
}

variable "administrator_login" {
  type = string
}

variable "administrator_password" {
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

variable "subnet_id" {
  type = string
}

variable "network_id" {
  type = string
}

variable "sku_name" {
  type    = string
  default = "B_Gen5_2"
}
