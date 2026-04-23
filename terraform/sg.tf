resource "aws_security_group" "postgres_access" {
  name        = "aurora-postgres-access"
  description = "Allow PostgreSQL inbound to Aurora cluster from private subnets"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description = "PostgreSQL from private subnets"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [
      data.aws_subnet.private-subnet-a.cidr_block,
      data.aws_subnet.private-subnet-b.cidr_block,
    ]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "aurora-postgres-access"
    Tier = "database"
  }
}
