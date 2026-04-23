resource "aws_db_instance" "postgres" {
  identifier              = local.db_identifier
  engine                  = local.engine
  engine_version          = local.engine_version
  instance_class          = var.instance_class
  allocated_storage       = var.allocated_storage
  storage_type            = "gp2"
  storage_encrypted       = true
  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.postgres.name
  vpc_security_group_ids  = [aws_security_group.postgres_access.id]
  backup_retention_period = var.backup_retention_period
  publicly_accessible     = false
  skip_final_snapshot     = true

  tags = {
    Name = local.db_identifier
  }
}

resource "aws_db_subnet_group" "postgres" {
  name       = "postgres-subnet-group"
  subnet_ids = [data.aws_subnet.private-subnet-a.id, data.aws_subnet.private-subnet-b.id]

  tags = {
    Name = "postgres-subnet-group"
  }
}
