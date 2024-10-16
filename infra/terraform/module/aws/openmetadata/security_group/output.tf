output "openmetaedata_aurora_security_group_id" {
  value = aws_security_group.aurora_sg.id
}

output "openmetadata_ecs_security_group_id" {
  value = aws_security_group.ecs_sg.id
}

output "openmetadata_lb_security_group_id" {
  value = aws_security_group.alb_sg.id
}