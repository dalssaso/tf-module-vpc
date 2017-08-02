resource "aws_vpc" "vpc_module" {
  cidr_block = "${var.cidr}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  enable_dns_support = "${var.enable_dns_support}"

  tags {
    Name = "${var.name}"
    Terraform = "true"
  }
}

resource "aws_internet_gateway" "vpc_module" {
  vpc_id = "${aws_vpc.vpc_module.id}"
  tags = {
    Name = "${var.name}-igw"
  }
}

resource "aws_route" "internet_access" {
  route_table_id = "${aws_vpc.vpc_module.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.vpc_module.id}"
}

resource "aws_subnet" "public" {
  vpc_id = "${aws_vpc.vpc_module.id}"
  cidr_block = "${var.public_subnet}"
  tags = {
    Name = "${var.name}-public"
  }
}
