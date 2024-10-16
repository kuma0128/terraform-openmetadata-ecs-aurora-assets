output "ecr_depends_on" {
  value = terraform_data.build_openmetadata_image.id
}