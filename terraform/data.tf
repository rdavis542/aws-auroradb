data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["vpc-east-1"]
  }
}

data "aws_subnet" "private-subnet-a" {
  filter {
    name   = "tag:Name"
    values = ["private-subnet-a"]
  }
}

data "aws_subnet" "private-subnet-b" {
  filter {
    name   = "tag:Name"
    values = ["private-subnet-b"]
  }
}
