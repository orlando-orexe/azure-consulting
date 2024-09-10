variable "env_prefix" {
  description = "Environment prefix (e.g., dev, qa, prod)"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
}

variable "address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
}

variable "address_prefixes" {
  description = "Address prefixes for the subnet"
  type        = list(string)
}

variable "location" {
  description = "Azure region where the resources will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the resources"
  type        = string
}
