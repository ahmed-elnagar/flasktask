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