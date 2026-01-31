module "dev_sg1"{
    source = "../modules/sg"
    vpc_name = module.dev_vpc_1.vpc_name
    vpc_id = module.dev_vpc_1.vpc_id
    ingress_value = ["80","8080","443","8443","3306","1900"]
    environment = module.dev_vpc_1.environment
    
    
}