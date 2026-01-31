module "dev_natgw_1" {
  source           = "../modules/nat"
  vpc_name         = module.dev_vpc_1.vpc_name
  public_subnet_id = module.dev_vpc_1.public_subnets_id_1
}