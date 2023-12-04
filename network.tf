resource "flexibleengine_vpc_v1" "flask_vpc"{
    name = "flask-vpc"
    cidr = "10.10.0.0/16"
}

resource "flexibleengine_vpc_subnet_v1" "flask_subnet" {
  name       = "flask-subnet"
  cidr       = "10.10.10.0/24"
  gateway_ip = "10.10.10.1"
  dns_list  = ["100.125.0.41","100.126.0.41"]
  vpc_id     = flexibleengine_vpc_v1.flask_vpc.id
}
resource "flexibleengine_vpc_eip" "eip_k8s" {
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    name       = "eip_k8s"
    size       = 10
    share_type = "PER"
  }
}
resource "flexibleengine_networking_secgroup_v2" "workstation_secgroup" {
  name        = "workstation_secgroup"
  description = "Work station Sec group"
}

resource "flexibleengine_networking_secgroup_rule_v2" "secgroup_rule_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = var.My_IP
  security_group_id = flexibleengine_networking_secgroup_v2.workstation_secgroup.id
}
resource "flexibleengine_networking_secgroup_rule_v2" "secgroup_rule_2" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 8080
  port_range_max    = 8080
  remote_ip_prefix  = var.My_IP
  security_group_id = flexibleengine_networking_secgroup_v2.workstation_secgroup.id
}