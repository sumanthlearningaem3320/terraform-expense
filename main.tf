module "vpc" {
  source = "./modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  env = var.env
  tags = var.tags
  public_subnets = var.public_subnets
  web_subnets = var.web_subnets
  app_subnets = var.app_subnets
  db_subnets = var.db_subnets
  azs = var.azs
  account_id = var.account_id
  default_vpc_id = var.default_vpc_id
  default_route_table  = var.default_route_table
  default_cidr_block = var.default_cidr_block
}

module "rds" {
  source = "./modules/rds"
  subnets = module.vpc.db_subnets
  env = var.env
  rds_allocate_storage = var.rds_allocate_storage
  rds_engine = var.rds_engine
  rds_engine_version = var.rds_engine_version
  rds_instnce_class = var.rds_instnce_class
  tags = var.tags
  sg_cidr = var.app_subnets
  vpc_id =  module.vpc.vpc_id
}

