variable "docker_image" {
  type    = string
  default = "almondsnext.azurecr.io/deutsch.la.almonds.next:prod-39-20240712200340"
}

variable "env_prefix" {
  default = "dev"
  type    = string
}

variable "project" {
  type    = string
  default = "almonds-next"
}

variable "sku_name" {
  type    = string
  default = "GP_Standard_D2ds_v4"
}

variable "location" {
  type    = string
  default = "East US 2"
}

# Dev variables

variable "dev_database_username" {
  type    = string
  default = "almondsnext"
}

variable "dev_database_password" {
  type    = string
  default = "P@ssw0rd1589"
}

variable "dev_sku_name" {
  type    = string
  default = "GP_Standard_D2ds_v4"
}

# QA variables

variable "qa_database_username" {
  type    = string
  default = "almondsnext"
}

variable "qa_database_password" {
  type    = string
  default = "P@ssw0rd1589"
}

variable "qa_sku_name" {
  type    = string
  default = "GP_Standard_D2ds_v4"
}

# Prod variables

variable "prod_database_username" {
  type    = string
  default = "almondsnext"
}

variable "prod_database_password" {
  type    = string
  default = "P@ssw0rd1589"
}

variable "prod_sku_name" {
  type    = string
  default = "GP_Standard_D2ds_v4"
}