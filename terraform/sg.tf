
resource "aws_security_group" "postgres_access" {

  vpc_id      = vpc.main.id
  name        = "postgres_access"
  description = "Allow pgsql Inbound"


  ingress {
    description = "pgsql access"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.db-public-subnet_a.cidr_block]
  }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "pgsql_access"
  }

}