resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  tags = merge(var.tags, {Name = "vpc-${var.env}"})


}
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  count = length(var.public_subnets)
  cidr_block        = var.public_subnets[count.index]
  tags = merge(var.tags, {Name = "vpc-public-subnets"})
  availability_zone = var.azs[count.index]

}
#resource "aws_subnet" "web" {
#  vpc_id            = aws_vpc.main.id
#  count = length(var.public_subnets)
#  cidr_block        = var.public_subnets[count.index]
#  tags = merge(var.tags, {Name = "vpc-web-subnets"})
#  availability_zone = var.azs[count.index]
#}
#resource "aws_subnet" "app" {
#  vpc_id            = aws_vpc.main.id
#  count = length(var.public_subnets)
#  cidr_block        = var.public_subnets[count.index]
#  tags = merge(var.tags, {Name = "vpc-app-subnets"})
#  availability_zone = var.azs[count.index]
#
#}
#resource "aws_subnet" "db" {
#  vpc_id            = aws_vpc.main.id
#  count = length(var.public_subnets)
#  cidr_block        = var.public_subnets[count.index]
#  tags = merge(var.tags, {Name = "vpc-db-subnets"})
#  availability_zone = var.azs[count.index]
#
#}
