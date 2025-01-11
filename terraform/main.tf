resource "aws_rds_cluster" "aurora_postgres" {
  cluster_identifier      = "aurora-postgres-serverless"
  engine                  = "aurora-postgresql"
  engine_version          = "13.6" # Replace with the desired Aurora PostgreSQL version
  master_username         = "admin" # Adjust as needed
  master_password         = "yourpassword" # Use a secure method to manage secrets
  database_name           = "mydatabase"
  storage_encrypted       = true
  backup_retention_period = 7
  preferred_backup_window = "07:00-09:00"

  # Serverless configuration
  engine_mode = "serverless"

  scaling_configuration {
    auto_pause               = true        # Enable automatic pause
    min_capacity             = 2           # Minimum ACU (Aurora Capacity Units)
    max_capacity             = 8           # Maximum ACU
    seconds_until_auto_pause = 300         # Auto-pause after 5 minutes
  }

  tags = {
    Name        = "aurora-postgres-serverless"
    Environment = "production"
  }
}

resource "aws_rds_cluster_subnet_group" "aurora_subnet_group" {
  name       = "aurora-subnet-group"
  subnet_ids = [data.aws_subnet.subnet_private_a.id, data.aws_subnet.subnet_private_b.id] # Replace with your VPC subnets

  tags = {
    Name = "aurora-subnet-group"
  }
}

