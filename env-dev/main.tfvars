vpc_cidr_block = "10.10.0.0/16"
env  = "dev"
tags = {
  company = "XYZ CO"
  bu-unit = "finance"
  project_name = "expense"
}

public_subnets = ["10.10.0.0/24","10.10.1.0/24"]
web_subnets = ["10.10.2.0/24","10.10.3.0/24"]
app_subnets = ["10.10.4.0/24","10.10.5.0/24"]
db_subnets = ["10.10.6.0/24","10.10.7.0/24"]
azs = ["us-east-1a","us-east-1b"]

account_id = "791028085567"
default_vpc_id = "vpc-0c75913009a169381"
default_route_table  = "rtb-0ab361ceaf70ad431"
default_cidr_block = "172.31.0.0/16"