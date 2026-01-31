resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.Vpc-mod.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }

  tags = {
    Name        = "${var.vpc_name}-public-rt"
    Owner       = local.Owner
    costcenter  = local.costcenter
    TeamDL      = local.TeamDL
    environment = "${var.environment}"
  }
}

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.Vpc-mod.id

  route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = var.natgw_id
  }

  tags = {
    Name        = "${var.vpc_name}-pvt-rt"
    Owner       = local.Owner
    costcenter  = local.costcenter
    TeamDL      = local.TeamDL
    environment = "${var.environment}"
  }
}

resource "aws_route_table_association" "terraform-public" {
    count="${length(var.public_cidr_block)}"
    subnet_id = "${element(aws_subnet.public-subnets.*.id,count.index)}"
    route_table_id = "${aws_route_table.public-route-table.id}"
}

resource "aws_route_table_association" "terraform-private" {
    count="${length(var.private_cidr_block)}"
    subnet_id = "${element(aws_subnet.private-subnets.*.id,count.index)}"
    route_table_id = "${aws_route_table.private-route-table.id}"
}
