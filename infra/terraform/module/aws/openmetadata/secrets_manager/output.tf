output "openmetadata_secret_name" {
  value = aws_secretsmanager_secret.openmetadata.name
}

output "aurora_secret_name" {
  value = aws_secretsmanager_secret.aurora.name
}