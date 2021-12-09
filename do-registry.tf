# Create a new container registry
resource "digitalocean_container_registry" "registry" {
  name                   = var.do_container_registry_name
  subscription_tier_slug = var.do_container_registry_type
}

resource "digitalocean_container_registry_docker_credentials" "registryCredentials" {
  registry_name = var.do_container_registry_name

  depends_on = [
    digitalocean_container_registry.registry
  ]
}