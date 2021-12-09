
###############################
# Provider Infos
###############################

output "Environment" {
  description = "DO Environment"
  value       = var.environment
}

output "region" {
  description = "DO region"
  value       = var.do_region
}

###############################
# DOKS Infos
###############################

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = var.doks_cluster_name
}

###############################
# Networking
###############################
output "vpc_name" {
  description = "VPC Name"
  value       = var.doks_cluster_name
}

###############################
# Spaces
###############################
output "spaces-0" {
  value = data.digitalocean_spaces_bucket.space0.bucket_domain_name
}

output "spaces-1" {
  value = data.digitalocean_spaces_bucket.space1.bucket_domain_name
}

###############################
# Container registry
###############################

output "RegistryEndpoint" {
  value = digitalocean_container_registry.registry.endpoint
}

###############################
# Secrets names
###############################

output "kubernetes_secret_git" {
  value = kubernetes_secret.main.id
}

###############################
# Others
###############################

