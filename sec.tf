
resource "openstack_networking_secgroup_v2" "main_sec_group" {
  name        = "main_sec_group"
  description = "My test security group"
}

resource "openstack_networking_secgroup_rule_v2" "allow_22" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  security_group_id = openstack_networking_secgroup_v2.main_sec_group.id
}

resource "openstack_networking_secgroup_rule_v2" "allow_icmp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  security_group_id = openstack_networking_secgroup_v2.main_sec_group.id
}
