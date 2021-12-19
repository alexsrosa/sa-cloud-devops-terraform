###############################
# General config
###############################
environment = "dev"

###############################
# Provider config
###############################
do_region = "fra1"

###############################
# Cluster config
###############################
doks_cluster_name    = "sa-cluster-dev"
doks_cluster_version = "1.21.5-do.0"
# https://docs.digitalocean.com/products/kubernetes/#allocatable-memory
doks_cluster_pool_size     = "s-4vcpu-8gb"
doks_cluster_pool_node_min = 2
doks_cluster_pool_node_max = 3


###############################
# Networking
###############################
do_vpc_name = "sa-vpc-dev"

###############################
# Container registry
###############################
do_container_registry_name = "sa-container-registry-dev"
do_container_registry_type = "basic"

###############################
# Spaces
###############################
do_spaces_name = [
  "sa-grafana-loki-bucket"
  ##, "sa-velero-bucket"
]

###############################
# GitHub config
# Important notes:
#  - This module expects your Git `repository` and `branch` to be created beforehand
#  - Currently, the `github_token` doesn't work with SSO
###############################
git_repository_name      = "sa-cloud-devops-flux" # Git repository where `Flux CD` manifests should be stored
git_repository_branch    = "main"                 # Branch name to use for this `Git` repository (e.g.: `main`)
git_repository_sync_path = "clusters/dev"         # Git repository path where the manifests to sync are committed (e.g.: `clusters/dev`)
git_repository_apps = {
  0 = "first-kotlin-cicd-app",
  1 = "second-kotlin-cicd-app"
}

# https://kubernetes.io/docs/concepts/policy/resource-quotas/
# # https://kubernetes.io/docs/concepts/policy/resource-quotas/