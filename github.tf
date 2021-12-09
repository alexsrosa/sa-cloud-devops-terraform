###############################
# SSH Deploy Key to use by Flux CD
###############################

data "github_repository" "main" {
  name = var.git_repository_name
}

resource "tls_private_key" "main" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P256"
}

resource "github_repository_deploy_key" "main" {
  title      = var.doks_cluster_name
  repository = data.github_repository.main.name
  key        = tls_private_key.main.public_key_openssh
  read_only  = true
}

#################################
# SSH Deploy Key to use by Apps
#################################
resource "tls_private_key" "apps" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P256"
  count       = length(var.git_repository_apps)
}

# Add the ssh key to every repo in github
resource "github_repository_deploy_key" "apps" {
  for_each   = tomap(var.git_repository_apps)
  title      = var.doks_cluster_name
  repository = each.value
  key        = tls_private_key.apps[each.key].public_key_openssh
  read_only  = false ## permit write on repos
}

#################################
# Save flux files on github repo
#################################
resource "github_repository_file" "install" {
  repository = data.github_repository.main.name
  file       = data.flux_install.main.path
  content    = data.flux_install.main.content
  branch     = var.git_repository_branch
}

resource "github_repository_file" "sync" {
  repository = data.github_repository.main.name
  file       = data.flux_sync.main.path
  content    = data.flux_sync.main.content
  branch     = var.git_repository_branch
}

resource "github_repository_file" "kustomize" {
  repository = data.github_repository.main.name
  file       = data.flux_sync.main.kustomize_path
  content    = data.flux_sync.main.kustomize_content
  branch     = var.git_repository_branch
}
