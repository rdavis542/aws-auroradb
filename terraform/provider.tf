terraform {
  required_version = ">=1.1.0"
  required_providers {
    aws = {
      version = ">= 4.0.0"
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "tfstategit"
    key    = "terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}


provider "aws" {

  region = var.region

}

# Secondary region setup (replica cluster)
provider "aws" {
  alias  = "secondary"
  region = "us-west-2" # Secondary region
}

