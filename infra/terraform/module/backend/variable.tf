variable "name_prefix" {
  type = string
}

variable "region_short_name" {
  type = string
}

variable "allowed_ip_list" {
  type = list(string)
}

variable "github_actions_iam_role_id" {
  type = list(string)
}

variable "allowed_vpce_ids" {
  type = list(string)
}
