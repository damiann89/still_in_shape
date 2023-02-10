
resource "openstack_networking_router_v2" "test_router" {
  name                = "test_router"
  admin_state_up      = true
  external_network_id = var.public_network_id
}

resource "openstack_networking_network_v2" "test_network_1" {
  name           = "test_network_1"
  admin_state_up = true
}

resource "openstack_networking_subnet_v2" "subnet_1" {
  network_id = openstack_networking_network_v2.test_network_1.id
  ip_version = 4
  cidr       = "10.2.0.0/22"
}

resource "openstack_networking_router_interface_v2" "router_subnet_1" {
  router_id = openstack_networking_router_v2.test_router.id
  subnet_id = openstack_networking_subnet_v2.subnet_1.id
}

resource "openstack_networking_network_v2" "test_network_2" {
  name           = "test_network_2"
  admin_state_up = true

}

resource "openstack_networking_subnet_v2" "subnet_2" {
  network_id = openstack_networking_network_v2.test_network_2.id
  ip_version = 4
  cidr       = "10.3.0.0/22"
}

resource "openstack_networking_router_interface_v2" "router_subnet_2" {
  router_id = openstack_networking_router_v2.test_router.id
  subnet_id = openstack_networking_subnet_v2.subnet_2.id
}