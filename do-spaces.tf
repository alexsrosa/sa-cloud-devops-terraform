# Create New Buckets
resource "digitalocean_spaces_bucket" "buckets" {
  for_each      = toset(var.do_spaces_name)
  name          = each.key
  region        = var.do_region
  acl           = "private"
  force_destroy = true
}

data "digitalocean_spaces_bucket" "space0" {
  name   = var.do_spaces_name[0]
  region = var.do_region
  depends_on = [
    digitalocean_spaces_bucket.buckets[0]
  ]
}

#data "digitalocean_spaces_bucket" "space1" {
#  name   = var.do_spaces_name[1]
#  region = var.do_region
#  depends_on = [
#    digitalocean_spaces_bucket.buckets[1]
#  ]
#}