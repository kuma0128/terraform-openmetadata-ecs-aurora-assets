variable "allowed_ip_list" {
  type = list(string)
}

variable "repository_list" {
  type = list(string)
}

variable "elasticsearch_tag" {
  type = string
}

variable "openmetadata_tag" {
  type = string
}

variable "ingestion_tag" {
  type = string
}

# child inputs
variable "vpc_id" {
  type = string
}

variable "ecr_kms_key_arn" {
  type = string
}