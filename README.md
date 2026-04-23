# aws-auroradb

Terraform project that deploys an Aurora PostgreSQL cluster into private subnets of an existing VPC, managed via GitHub Actions.

## Resources

- `aws_rds_cluster` — Aurora PostgreSQL 16.1 cluster with encryption at rest
- `aws_rds_cluster_instance` — Cluster instance(s), configurable count
- `aws_db_subnet_group` — Subnet group using private subnets
- `aws_security_group` — Allows PostgreSQL (5432) inbound from private subnets

## Prerequisites

- Existing VPC tagged `Name = vpc-east-1`
- Existing private subnets tagged `Name = private-subnet-a` and `Name = private-subnet-b`
- S3 bucket `tf-state-replication-source-350726165848` for Terraform state
- GitHub secrets: `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `TF_VAR_DB_PASSWORD`

## Variables

| Name | Description | Default |
|------|-------------|---------|
| `region` | AWS region | `us-east-2` |
| `db_name` | Initial database name | `appdb` |
| `db_username` | Master username | `postgres` |
| `db_password` | Master password (**sensitive, required**) | — |
| `instance_class` | Instance class | `db.t3.medium` |
| `instance_count` | Number of instances | `1` |
| `backup_retention_period` | Backup retention in days | `7` |

## Outputs

| Name | Description |
|------|-------------|
| `cluster_id` | Cluster identifier |
| `cluster_arn` | Cluster ARN |
| `cluster_endpoint` | Writer endpoint |
| `cluster_reader_endpoint` | Reader endpoint |
| `cluster_port` | Cluster port |
| `security_group_id` | Security group ID |
| `db_subnet_group_name` | Subnet group name |

## Usage

### GitHub Actions (recommended)

- **Create**: Run `aws-auroradb-build` workflow manually (applies) or push to `terraform/**` on main (plans only)
- **Destroy**: Run `aws-auroradb-destroy` workflow and type `destroy` to confirm
- **Security scan**: Runs automatically on push/PR, weekly, or manually

### Local

```bash
cd terraform
terraform init
terraform plan -var="db_password=<your-password>"
terraform apply -var="db_password=<your-password>"
```
