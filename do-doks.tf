###############################
# DOKS
###############################

resource "digitalocean_kubernetes_cluster" "primary" {
  name         = var.doks_cluster_name
  region       = var.do_region
  version      = var.doks_cluster_version
  vpc_uuid     = digitalocean_vpc.vpc.id
  auto_upgrade = false

  node_pool {
    name       = "${var.doks_cluster_name}-pool"
    size       = var.doks_cluster_pool_size
    auto_scale = true
    min_nodes  = var.doks_cluster_pool_node_min
    max_nodes  = var.doks_cluster_pool_node_max
  }

  depends_on = [
    digitalocean_vpc.vpc
  ]
}

data "digitalocean_kubernetes_cluster" "primary" {
  name = var.doks_cluster_name
  depends_on = [
    digitalocean_kubernetes_cluster.primary
  ]
}