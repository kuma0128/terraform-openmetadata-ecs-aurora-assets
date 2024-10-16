variable "domain_name" {
  type = string
}

variable "name_prefix" {
  type = string
}

variable "region_short_name" {
  type = string
}

# child inputs
variable "vpc_id" {
  type = string
}

variable "subnet_a_public_id" {
  type = string
}

variable "subnet_c_public_id" {
  type = string
}

variable "openmetadata_lb_security_group_id" {
  type = string
}