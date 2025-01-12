locals {
  common = {
    env               = "dev"
    pj_name           = "ethan"
    region_short_name = "apne1"
    allowed_ip_list = [
      ""
    ]
    allowed_vpce_ids           = []
    github_actions_iam_role_id = []
  }
}