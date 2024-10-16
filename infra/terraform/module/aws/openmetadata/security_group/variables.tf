variable "name_prefix" {
  type = string
}

variable "region_short_name" {
  type = string
}

variable "allowed_ip_list" {
  type = list(string)
}

# child inputs
variable "vpc_id" {
  type = string
}