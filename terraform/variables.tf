variable "region" {
  type        = string
  description = "region you want to use"
}

# Define variables for snapshot ID and database details
variable "db_snapshot_id" {
  description = "The snapshot ID to restore the Aurora cluster from"
}

variable "cluster_identifier" {
  description = "The identifier for the Aurora cluster"
}

variable "global_cluster_identifier" {
  description = "The identifier for the Aurora global cluster"
}


variable "subnet_private_a" {

  type        = string
  description = "subnets to support the vpc"

}

variable "subnet_private_b" {

  type        = string
  description = "subnets to support the vpc"

}

variable "subnet_private_c" {

  type        = string
  description = "subnets to support the vpc"

}

variable "subnet_public_a" {

  type        = string
  description = "subnets to support the vpc"

}

variable "subnet_public_b" {

  type        = string
  description = "subnets to support the vpc"

}

variable "subnet_public_c" {

  type        = string
  description = "subnets to support the vpc"

}

variable "cidr_block" {

  type        = string
  description = "VPC cidr range"

}

variable "azA" {

  type        = string
  description = "Avail zone assigned"

}

variable "azB" {

  type        = string
  description = "Avail zone assigned"

}


variable "azC" {

  type        = string
  description = "Avail zone assigned"

}


variable "default_tags" {
  description = "Default tags too apply to all resources"
  default = {
    "Environment"    = "Development"
    "Infrastructure" = "VPC"
    "REPO"           = "aws-ec2-base"
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