resource "flexibleengine_compute_instance_v2" "workstation" {
  name            = "workstation"
  image_name      = var.image_name
  flavor_id       = var.flavor_id
  key_pair        = var.ssh_key
  security_groups = ["workstation_secgroup"]

  network {
    uuid = flexibleengine_vpc_subnet_v1.flask_subnet.id
  }
}