resource "kubernetes_namespace" "apps" {
  metadata {
    name = "apps"
  }

  depends_on = [
    digitalocean_kubernetes_cluster.primary
  ]
}