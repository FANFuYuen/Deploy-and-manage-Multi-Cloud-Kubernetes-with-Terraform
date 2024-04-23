resource "db_parameter_group" "rds4121" {
  name   = "rds4121"
  family = "postgres14"

  parameter {
    name  = "log"
    value = "1"
  }
}

resource "aws_db_instance" "rds4121" {
  identifier             = "rds4121-database"
  instance_class         = "db.t2.micro" # 使用比 db.t3.micro 更便宜的實例類型
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "14.11"
  username               = "rdsdb123"
  password               = "rdsdb123"
  db_subnet_group_name   = rds_db_subnet.vpc.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  parameter_group_name   = db_parameter_group.rds4121.name
  publicly_accessible    = true
  skip_final_snapshot    = true
}

