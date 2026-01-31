module "dev_natgw_1" {
  source           = "../modules/nat"
  vpc_name         = module.prod_vpc_1
  public_subnet_id = module.prod_vpc_1.public_subnets_id_1
}