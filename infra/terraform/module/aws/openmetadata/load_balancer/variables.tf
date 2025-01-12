variable "domain_name" {
  type        = string
  description = "value of the domain name"
}

variable "name_prefix" {
  type        = string
  description = "value of the name prefix"
}

variable "region_short_name" {
  type        = string
  description = "value of the region short name"
}

# child inputs
variable "vpc_id" {
  type        = string
  description = "value of the vpc id"
}

variable "subnet_a_public_id" {
  type        = string
  description = "value of the subnet a public id"
}

variable "subnet_c_public_id" {
  type        = string
  description = "value of the subnet c public id"
}

variable "openmetadata_lb_security_group_id" {
  type        = string
  description = "value of the openmetadata lb security group id"
}