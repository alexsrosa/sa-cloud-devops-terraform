
###############################
# General
###############################
variable "environment" {
  description = "Environment type"
}

variable "do_region" {
  description = "Digital Ocean Region"
  type        = string
}

variable "spaces_access_id" {
  description = "Digital Ocean Access id"
  type        = string
}

variable "spaces_secret_key" {
  description = "Digital Ocean Secret Key"
  type        = string
}

###############################
# DOKS
###############################
variable "do_api_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
}

variable "doks_cluster_name" {
  description = "DOKS cluster name"
  type        = string
}

variable "doks_cluster_version" {
  description = "Kubernetes version provided by DOKS"
  type        = string
  default     = "1.21.5-do.0" # Grab the latest version slug from "doctl kubernetes options versions"
}

variable "doks_cluster_pool_size" {
  description = "DOKS cluster node pool size"
  type        = string
}

variable "doks_cluster_pool_node_min" {
  description = "DOKS cluster worker nodes min"
  type        = number
}

variable "doks_cluster_pool_node_max" {
  description = "DOKS cluster worker nodes max"
  type        = number
}

###############################
# Networking
###############################
variable "do_vpc_name" {
  description = "DO vpc name"
  type        = string
}

###############################
# Container registry
###############################
variable "do_container_registry_name" {
  description = "DO Container Registry name"
  type        = string
}

variable "do_container_registry_type" {
  description = "DO Container Registry type"
  type        = string
}

###############################
# Spaces
###############################
variable "do_spaces_name" {
  description = "DO Spaces names"
  type        = list(string)
}

###############################
# GitHub Variables
###############################
variable "github_user" {
  description = "GitHub owner"
  type        = string
}

variable "github_token" {
  description = "GitHub token"
  type        = string
  sensitive   = true
}

variable "github_ssh_pub_key" {
  description = "GitHub SSH public key"
  type        = string
  default     = "github.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg="
}

variable "git_repository_name" {
  description = "Git main repository to use for installation"
  type        = string
}

variable "git_repository_branch" {
  description = "Branch name to use on the Git repository"
  type        = string
  default     = "main"
}

variable "git_repository_sync_path" {
  description = "Git repository directory path to use for Flux CD sync"
  type        = string
}

variable "git_repository_apps" {
  description = "List of repo apps"
  type        = map(string)
}