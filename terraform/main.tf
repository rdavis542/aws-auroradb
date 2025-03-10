resource "aws_db_instance" "free_tier_db" {
  identifier             = "my-free-tier-db"
  allocated_storage      = 20  # Minimum required for Free Tier
  storage_type           = "gp2"
  engine                = "postgres"  # Change to "postgres" for PostgreSQL
  engine_version        = "17.3"    # Change to PostgreSQL version if needed
  instance_class        = "db.t3.micro"  # Free Tier eligible
  username             = "admin"
  password             = "YourSecurePassword123!"  # Use sensitive variables in production!
  #parameter_group_name = "default.mysql8.0"  # Change to default.postgresxx for PostgreSQL
  publicly_accessible  = false  # Change to true if you need external access
  skip_final_snapshot  = true   # Avoid final snapshot charges
  backup_retention_period = 7   # Retain automated backups for 7 days

  vpc_security_group_ids = [aws_security_group.postgres_access.id]
}


