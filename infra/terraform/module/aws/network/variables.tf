variable "env" {
  type = string
}

variable "region" {
  type = string
}

variable "name_prefix" {
  type = string
}

variable "region_short_name" {
  type = string
}

variable "az_a_name" {
  type = string
}

variable "az_c_name" {
  type = string
}

variable "cidr_vpc" {
  type = string
}

variable "cidr_subnets_public" {
  type = list(string)
}

variable "cidr_subnets_private" {
  type = list(string)
}
