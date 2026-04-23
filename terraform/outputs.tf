output "db_instance_id" {
  description = "RDS instance identifier"
  value       = aws_db_instance.postgres.id
}

output "db_instance_arn" {
  description = "RDS instance ARN"
  value       = aws_db_instance.postgres.arn
}

output "db_endpoint" {
  description = "Connection endpoint for the RDS instance"
  value       = aws_db_instance.postgres.endpoint
}

output "db_port" {
  description = "Port the RDS instance is listening on"
  value       = aws_db_instance.postgres.port
}

output "security_group_id" {
  description = "ID of the security group controlling RDS access"
  value       = aws_security_group.postgres_access.id
}

output "db_subnet_group_name" {
  description = "Name of the DB subnet group"
  value       = aws_db_subnet_group.postgres.name
}
