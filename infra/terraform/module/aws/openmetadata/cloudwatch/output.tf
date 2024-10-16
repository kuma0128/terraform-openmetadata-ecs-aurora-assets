output "elastic_search_log_group_name" {
  value = aws_cloudwatch_log_group.elastic_search.name
}

output "migrate_all_log_group_name" {
  value = aws_cloudwatch_log_group.migrate_all.name
}

output "openmetadata_server_log_group_name" {
  value = aws_cloudwatch_log_group.openmetadata_server.name
}

output "openmetadata_airflow_log_group_name" {
  value = aws_cloudwatch_log_group.openmetadata_airflow.name
}