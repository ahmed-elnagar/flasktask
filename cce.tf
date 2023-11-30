resource "flexibleengine_cce_cluster_v3" "flask_cluster"{
    name                   = "flask-cluster"
    cluster_type           = "VirtualMachine"
    authentication_mode    = "rbac"
    description            = "flask-production-CCE-cluster"
    flavor_id              = "cce.s1.small"
    vpc_id                 = flexibleengine_vpc_v1.flask_vpc.id
    subnet_id              = flexibleengine_vpc_subnet_v1.flask_subnet.id
    container_network_type = "overlay_l2"
}
resource "flexibleengine_cce_node_v3" "node_1" {
  cluster_id        = flexibleengine_cce_cluster_v3.flask_cluster.id
  name              = "flask-node1"
  os                = "CentOS 7.7"
  flavor_id         = var.flavor_id
  availability_zone = var.availability_zone
  key_pair          = var.ssh_key
  iptype            = "5_bgp"
  sharetype         = "PER"
  bandwidth_size    = 100

  root_volume {
    size       = 40
    volumetype = "SATA"
  }
    data_volumes {
    size       = 100
    volumetype = "SATA"
  }
}
resource "flexibleengine_cce_node_v3" "node_2" {
  cluster_id        = flexibleengine_cce_cluster_v3.flask_cluster.id
  name              = "flask-node2"
  os                = "CentOS 7.7"
  flavor_id         = var.flavor_id
  availability_zone = var.availability_zone
  key_pair          = var.ssh_key
  iptype            = "5_bgp"
  sharetype         = "PER"
  bandwidth_size    = 100

  root_volume {
    size       = 40
    volumetype = "SATA"
  }
    data_volumes {
    size       = 100
    volumetype = "SATA"
  }
}