tflint {
  required_version = ">= 0.54.0"
}

config {
  force               = false
  call_module_type    = "all"
  disabled_by_default = false
  ignore_module       = {}
}

plugin "aws" {
    enabled = true
    version = "0.37.0"
    source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

plugin "terraform" {
    enabled = true
    version = "0.10.0"
  source  = "github.com/terraform-linters/tflint-ruleset-terraform"
}

rule "terraform_comment_syntax" {
  enabled = true
}

rule "terraform_standard_module_structure" {
  enabled = false
}

rule "terraform_required_version" {
  enabled = false
}

rule "terraform_required_providers" {
  enabled = false
}