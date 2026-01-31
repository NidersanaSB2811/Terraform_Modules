module "prod_ec2_1"{
    source = "../modules/compute"
    aws_region = var.aws_region
    environment = module.prod_vpc_1.environment
    vpc_name = module.prod_vpc_1.vpc_name
    key_name = "vs1.pem"
    amis = {
    us-east-1 = "ami-020cba7c55df1f615"
    us-east-2 = "ami-0d1b5a8c13042c939"}
    public_subnets = module.prod_vpc_1.public_subnets
    private_subnets = module.prod_vpc_1.private_subnets
    sg_id = module.prod_sg1.sg_id
}