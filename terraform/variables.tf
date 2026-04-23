variable "region" {
  type        = string
  description = "AWS region to deploy resources"
  default     = "us-east-2"
}

variable "db_name" {
  type        = string
  description = "Name of the initial database to create"
  default     = "appdb"
}

variable "db_username" {
  type        = string
  description = "Master username for the RDS instance"
  default     = "postgres"
}

variable "db_password" {
  type        = string
  description = "Master password for the RDS instance"
  sensitive   = true
}

variable "instance_class" {
  type        = string
  description = "RDS instance class"
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  type        = number
  description = "Allocated storage in GB"
  default     = 20
}

variable "backup_retention_period" {
  type        = number
  description = "Number of days to retain automated backups"
  default     = 7
}
