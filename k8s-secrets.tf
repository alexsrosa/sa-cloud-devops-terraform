resource "kubernetes_secret" "main" {
  depends_on = [kubectl_manifest.install]

  metadata {
    name      = data.flux_sync.main.secret
    namespace = data.flux_sync.main.namespace
  }

  data = {
    identity       = tls_private_key.main.private_key_pem
    "identity.pub" = tls_private_key.main.public_key_pem
    known_hosts    = var.github_ssh_pub_key
  }
}

resource "kubernetes_secret" "apps" {
  for_each   = tomap(var.git_repository_apps)
  depends_on = [kubectl_manifest.install]

  metadata {
    name      = each.value
    namespace = data.flux_sync.main.namespace
  }

  data = {
    identity       = tls_private_key.apps[each.key].private_key_pem
    "identity.pub" = tls_private_key.apps[each.key].public_key_pem
    known_hosts    = var.github_ssh_pub_key
  }
}

resource "kubernetes_secret" "registry" {
  # Include here any other namespace that need secret to access docker registry
  for_each = toset([
    kubernetes_namespace.apps.metadata[0].name,
    kubernetes_namespace.flux_system.metadata[0].name
  ])

  metadata {
    name      = "docker-cfg"
    namespace = each.key
  }

  data = {
    ".dockerconfigjson" = digitalocean_container_registry_docker_credentials.registryCredentials.docker_credentials
  }

  type = "kubernetes.io/dockerconfigjson"

  depends_on = [
    digitalocean_container_registry_docker_credentials.registryCredentials
  ]
}