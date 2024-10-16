output "aurora_kms_key_arn" {
  value = aws_kms_key.aurora.arn
}

output "ecr_kms_key_arn" {
  value = aws_kms_key.ecr.arn
}

output "s3_kms_key_arn" {
  value = aws_kms_key.s3.arn
}