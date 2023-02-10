
# Define provider
terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.48.0"
    }
  }
}
#TODO sort out provider inheritance since it doesn't look pretty

resource "openstack_compute_instance_v2" "test_instance" {
  count = var.replicas
  name = "${var.instance_name}-${count.index}"
  flavor_name = var.instance_flavour
  image_name = var.instance_image
  key_pair = var.instance_key_pair
  network {
    name = var.network_name
  }
}