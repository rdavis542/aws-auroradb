variable "region" {
  type        = string
  description = "region you want to use"
  default = "us-east-1"
}

# Define variables for snapshot ID and database details
variable "db_snapshot_id" {
  description = "The snapshot ID to restore the Aurora cluster from"
  default = ""
}

variable "cluster_identifier" {
  description = "The identifier for the Aurora cluster"
  default = ""
}

variable "global_cluster_identifier" {
  description = "The identifier for the Aurora global cluster"
  default = ""
}

variable "default_tags" {
  description = "Default tags too apply to all resources"
  default = {
    "Environment"    = "Development"
    "Infrastructure" = "rds_instance"
    "REPO"           = "aws-auroradb"
  }

}
variable "volume_size" {

  type    = string
  default = "20"

}

variable "instance_type" {

  type    = string
  default = "t2.micro"
}