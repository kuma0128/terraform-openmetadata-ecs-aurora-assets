variable "name_prefix" {
  type = string
}

variable "region_short_name" {
  type = string
}

variable "allowed_ip_list" {
  type = list(string)
}

variable "s3_gateway_endpoint_id" {
  type = string
}

# child inputs
variable "s3_kms_key_arn" {
  type = string
}