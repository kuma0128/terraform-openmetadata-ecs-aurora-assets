output "subnet_a_public_id" {
  value = aws_subnet.public_a.id
}

output "subnet_c_public_id" {
  value = aws_subnet.public_c.id
}

output "subnet_a_private_id" {
  value = aws_subnet.private_a.id
}

output "subnet_c_private_id" {
  value = aws_subnet.private_c.id
}

output "vpc_id" {
  value = aws_vpc.this.id
}

output "s3_gateway_endpoint_id" {
  value = aws_vpc_endpoint.s3.id
}