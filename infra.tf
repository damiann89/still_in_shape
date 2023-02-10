
module "instance_subnet1" {
  source             = "./modules/instance"
  replicas           = 2
  instance_flavour   = var.flavour
  instance_image     = var.image
  instance_key_pair  = var.ssh_key
  instance_name      = "instance1"
  network_name       = openstack_networking_network_v2.test_network_1.name
  security_group_ids = [openstack_networking_secgroup_v2.main_sec_group.id]
}

module "instance_subnet2" {
  source             = "./modules/instance"
  instance_flavour   = var.flavour
  instance_image     = var.image
  instance_key_pair  = var.ssh_key
  instance_name      = "instance3"
  network_name       = openstack_networking_network_v2.test_network_2.name
  security_group_ids = [openstack_networking_secgroup_v2.main_sec_group.id]
}