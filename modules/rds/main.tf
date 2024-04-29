resource "aws_db_parameter_group" "main" {
  name   = "${var.env}-mysql-rds"
  family = "mysql5.7"
  tags = merge(var.tags, {Name = "${var.env}-mysql-rds"})
}

resource "aws_db_subnet_group" "main" {
  name       = "${var.env}-mysql-rds"
  subnet_ids = var.subnets
  tags = merge(var.tags, {Name = "${var.env}-mysql-rds"})
}

resource "aws_security_group" "main" {
  name        = "${var.env}-mysql-rds"
  description = "${var.env}-mysql-rds"
  vpc_id      = var.vpc_id


   ingress {
     description = "MYSQL"
    cidr_blocks  = var.sg_cidr
    from_port   = 3306
    ip_protocol = "tcp"
    to_port     = 3306
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {Name = "${var.env}-mysql-rds"})


}

resource "aws_db_instance" "main" {
  allocated_storage    = var.rds_allocate_storage
  db_name              = "mydb"
  engine               = var.rds_engine
  engine_version       = var.rds_engine_version
  instance_class       = var.rds_instnce_class
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = aws_db_parameter_group.main.name
  skip_final_snapshot  = true
  multi_az = true
  storage_type = "gp3"
  identifier = "${var.env}-mysql-rds"
  db_subnet_group_name = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.main.id]
}
resource "aws_ssm_parameter" "main" {
  name  = "foo"
  type  = "String"
  value = "bar"
}




