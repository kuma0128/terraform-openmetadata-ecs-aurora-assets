resource "aws_dynamodb_table" "this" {
  name           = "${var.name_prefix}-dynamodb-${var.region_short_name}-tfstate-lock"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  server_side_encryption {
    enabled     = true
    kms_key_arn = aws_kms_key.this.arn
  }

  tags = {
    Terraform = "true"
    Name      = "${var.name_prefix}-dynamodb-${var.region_short_name}-tfstate-lock"
  }
}

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

resource "aws_kms_key" "this" {
  description             = "KMS key for backend_dynamodb"
  deletion_window_in_days = 7
  enable_key_rotation     = true
  rotation_period_in_days = 365

  tags = {
    name = "${var.name_prefix}-kms-${var.region_short_name}-backend-dynamodb"
  }
}
resource "aws_kms_alias" "this" {
  name          = "alias/${var.name_prefix}-kmsalias-${var.region_short_name}-backend-dynamodb"
  target_key_id = aws_kms_key.this.key_id
}