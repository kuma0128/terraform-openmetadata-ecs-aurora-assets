module "backend" {
  source                     = "../../../module/backend"
  name_prefix                = "${local.common.pj_name}-${local.common.env}"
  region_short_name          = local.common.region_short_name
  allowed_ip_list            = local.common.allowed_ip_list
  github_actions_iam_role_id = local.common.github_actions_iam_role_id
  allowed_vpce_ids           = local.common.allowed_vpce_ids
}