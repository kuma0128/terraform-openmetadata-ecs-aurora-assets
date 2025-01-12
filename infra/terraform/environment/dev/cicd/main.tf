module "iam_github_oidc" {
  source            = "../../../module/aws/iam_github_oidc"
  name_prefix       = "${local.common.pj_name}-${local.common.env}"
  region_short_name = local.common.region_short_name
  repo_full_name    = local.common.repo_full_name
}
