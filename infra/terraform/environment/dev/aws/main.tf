module "iam_github_oidc" {
  source            = "../../../module/aws/iam_github_oidc"
  name_prefix       = "${local.common.pj_name}-${local.common.env}"
  region_short_name = local.common.region_short_name
  repo_full_name    = local.common.repo_full_name
}

module "network" {
  source               = "../../../module/aws/network"
  name_prefix          = "${local.common.pj_name}-${local.common.env}"
  region               = local.common.region
  region_short_name    = local.common.region_short_name
  az_a_name            = local.network.az_a_name
  az_c_name            = local.network.az_c_name
  cidr_vpc             = local.network.cidr_vpc
  cidr_subnets_public  = local.network.cidr_subnets_public
  cidr_subnets_private = local.network.cidr_subnets_private
}

module "openmetadata_kms_key" {
  source            = "../../../module/aws/openmetadata/kms_key"
  region_short_name = local.common.region_short_name
  name_prefix       = "${local.common.pj_name}-${local.common.env}"
}

module "openmetadata_s3" {
  source                 = "../../../module/aws/openmetadata/s3"
  name_prefix            = "${local.common.pj_name}-${local.common.env}"
  region_short_name      = local.common.region_short_name
  allowed_ip_list        = local.common.allowed_ip_list
  s3_gateway_endpoint_id = module.network.s3_gateway_endpoint_id
  s3_kms_key_arn         = module.openmetadata_kms_key.s3_kms_key_arn
}

module "openmetadata_iam" {
  source                    = "../../../module/aws/openmetadata/iam"
  name_prefix               = "${local.common.pj_name}-${local.common.env}"
  region_short_name         = local.common.region_short_name
  docker_envfile_bucket_arn = module.openmetadata_s3.docker_envfile_bucket_arn
}

module "openmetadata_security_group" {
  source            = "../../../module/aws/openmetadata/security_group"
  name_prefix       = "${local.common.pj_name}-${local.common.env}"
  region_short_name = local.common.region_short_name
  allowed_ip_list   = local.common.allowed_ip_list
  vpc_id            = module.network.vpc_id
}

module "openmetadata_secretmanager" {
  source            = "../../../module/aws/openmetadata/secrets_manager"
  name_prefix       = "${local.common.pj_name}-${local.common.env}"
  region_short_name = local.common.region_short_name
}

module "openmetadata_cloudwatch" {
  source                = "../../../module/aws/openmetadata/cloudwatch"
  log_retention_in_days = local.openmetadata.log_retention_in_days
}

module "openmetadata_aurora" {
  source                   = "../../../module/aws/openmetadata/aurora"
  name_prefix              = "${local.common.pj_name}-${local.common.env}"
  region_short_name        = local.common.region_short_name
  subnet_a_private_id      = module.network.subnet_a_private_id
  subnet_c_private_id      = module.network.subnet_c_private_id
  aurora_kms_key_arn       = module.openmetadata_kms_key.aurora_kms_key_arn
  aurora_security_group_id = module.openmetadata_security_group.openmetaedata_aurora_security_group_id
  aurora_secret_name       = module.openmetadata_secretmanager.aurora_secret_name
}

module "openmetadata_ecr" {
  source            = "../../../module/aws/openmetadata/ecr"
  ecr_kms_key_arn   = module.openmetadata_kms_key.ecr_kms_key_arn
  repository_list   = local.openmetadata.repository_list
  elasticsearch_tag = local.openmetadata.elasticsearch_tag
  openmetadata_tag  = local.openmetadata.openmetadata_tag
  ingestion_tag     = local.openmetadata.ingestion_tag
}

module "openmetadata_lb" {
  source                            = "../../../module/aws/openmetadata/load_balancer"
  domain_name                       = local.openmetadata.domain_name
  name_prefix                       = "${local.common.pj_name}-${local.common.env}"
  region_short_name                 = local.common.region_short_name
  vpc_id                            = module.network.vpc_id
  subnet_a_public_id                = module.network.subnet_a_public_id
  subnet_c_public_id                = module.network.subnet_c_public_id
  openmetadata_lb_security_group_id = module.openmetadata_security_group.openmetadata_lb_security_group_id
}

module "openmetadata_ecs" {
  source                              = "../../../module/aws/openmetadata/ecs"
  region                              = local.common.region
  region_short_name                   = local.common.region_short_name
  name_prefix                         = "${local.common.pj_name}-${local.common.env}"
  subnet_a_private_id                 = module.network.subnet_a_private_id
  subnet_c_private_id                 = module.network.subnet_c_private_id
  desired_count                       = local.openmetadata.desired_count
  domain_name                         = local.openmetadata.domain_name
  elasticsearch_tag                   = local.openmetadata.elasticsearch_tag
  openmetadata_tag                    = local.openmetadata.openmetadata_tag
  ingestion_tag                       = local.openmetadata.ingestion_tag
  ecs_task_role_arn                   = module.openmetadata_iam.ecs_task_role_arn
  ecs_task_execution_role_arn         = module.openmetadata_iam.ecs_task_execution_role_arn
  openmetadata_secret_name            = module.openmetadata_secretmanager.openmetadata_secret_name
  aurora_cluster_endpoint             = module.openmetadata_aurora.aurora_cluster_endpoint
  docker_envfile_bucket_arn           = module.openmetadata_s3.docker_envfile_bucket_arn
  elastic_search_log_group_name       = module.openmetadata_cloudwatch.elastic_search_log_group_name
  migrate_all_log_group_name          = module.openmetadata_cloudwatch.migrate_all_log_group_name
  openmetadata_server_log_group_name  = module.openmetadata_cloudwatch.openmetadata_server_log_group_name
  openmetadata_airflow_log_group_name = module.openmetadata_cloudwatch.openmetadata_airflow_log_group_name
  openmetadata_ecs_security_group_id  = module.openmetadata_security_group.openmetadata_ecs_security_group_id
  openmetadata_target_group_arn       = module.openmetadata_lb.openmetadata_target_group_arn
  ecr_depends_on                      = module.openmetadata_ecr.ecr_depends_on
}
