resource "aws_s3_bucket" "this" {
  bucket = "${var.name_prefix}-s3-${var.region_short_name}-tfstate"
  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Terraform = "true"
    Name      = "${var.name_prefix}-s3-${var.region_short_name}-tfstate"
  }
}

resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id
  policy = templatefile(
    "${path.module}/bucket_policy/backend.json.tpl",
    {
      s3_bucket_arn     = aws_s3_bucket.this.arn
      allowed_aws_roles = var.github_actions_iam_role_id
      allowed_vpce_ids  = var.allowed_vpce_ids
      allowed_ips       = var.allowed_ip_list
    }
  )
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}
