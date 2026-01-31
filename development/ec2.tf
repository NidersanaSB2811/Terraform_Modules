module "dev_ec2_1"{
    source = "../modules/compute"
    aws_region = var.aws_region
    environment = module.dev_vpc_1.environment
    vpc_name = module.dev_vpc_1.vpc_name
    key_name = "vs1.pem"
    amis = {
    us-east-1 = "ami-020cba7c55df1f615"
    us-east-2 = "ami-0d1b5a8c13042c939"}
    public_subnets = module.dev_vpc_1.public_subnets
    private_subnets = module.dev_vpc_1.private_subnets
    sg_id = module.dev_sg1.sg_id
}

module "dev_elb_1" {
  source          = "../modules/elb"
  environment     = module.dev_vpc_1.environment
  nlbname         = "dev-nlb"
  subnets         = module.dev_vpc_1.public_subnets_id
  tgname          = "dev-nlb-tg"
  vpc_id          = module.dev_vpc_1.vpc_id
  #servers = module.dev_compute_1.private_servers
  servers = concat(module.dev_compute_1.private_servers, module.dev_compute_1.public_servers)
}

module "dev_iam_1" {
  source              = "../modules/iam"
  environment         = module.dev_vpc_1.environment
  rolename            = "SaiTMRole"
  instanceprofilename = "SaiTMinstprofile"
}