variable "domain_name" {
  type = string
}

variable "region" {
  type = string
}

variable "region_short_name" {
  type = string
}

variable "name_prefix" {
  type = string
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
variable "subnet_a_private_id" {
  type = string
}

variable "subnet_c_private_id" {
  type = string
}

variable "openmetadata_target_group_arn" {
  type = string
}

variable "openmetadata_ecs_security_group_id" {
  type = string
}

variable "ecs_task_role_arn" {
  type = string
}

variable "ecs_task_execution_role_arn" {
  type = string
}

variable "openmetadata_secret_name" {
  type = string
}

variable "aurora_cluster_endpoint" {
  type = string
}

variable "docker_envfile_bucket_arn" {
  type = string
}

variable "elastic_search_log_group_name" {
  type = string
}

variable "migrate_all_log_group_name" {
  type = string
}

variable "openmetadata_server_log_group_name" {
  type = string
}

variable "openmetadata_airflow_log_group_name" {
  type = string
}

variable "ecr_depends_on" {
  type = string
}