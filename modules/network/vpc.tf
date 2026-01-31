resource "aws_vpc" "Vpc-mod" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name        = "${var.vpc_name}"
    Owner       = local.Owner
    costcenter  = local.costcenter
    TeamDL      = local.TeamDL
    environment = "${var.environment}"
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.Vpc-mod.id
  tags = {
    Name = "${var.vpc_name}-IGW"
  }
}