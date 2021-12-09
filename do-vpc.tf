# Create a new vpc
resource "digitalocean_vpc" "vpc" {
  name   = var.do_vpc_name
  region = var.do_region
}