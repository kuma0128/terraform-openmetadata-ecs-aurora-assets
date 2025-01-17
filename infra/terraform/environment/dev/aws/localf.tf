locals {
  common = {
    env               = "dev"
    pj_name           = "ethan"
    region            = "ap-northeast-1"
    region_short_name = "apne1"
    allowed_ip_list = [
      ""
    ]
  }

  network = {
    cidr_vpc = ""
    cidr_subnets_public = [
      "",
      ""
    ]
    cidr_subnets_private = [
      "",
      ""
    ]
    az_a_name = "ap-northeast-1a"
    az_c_name = "ap-northeast-1c"
  }

  openmetadata = {
    domain_name = ""
    repository_list = [
      "elasticsearch",
      "openmetadata/server",
      "openmetadata/ingestion"
    ]
    elasticsearch_tag     = "8.11.4"
    openmetadata_tag      = "1.6.2"
    ingestion_tag         = "1.6.2"
    log_retention_in_days = 30
    desired_count         = 1
  }

  aurora = {
    backup_retention_period = 7
    instance_count          = 1
  }
}