# --- RDS Security Group ---
resource "aws_security_group" "rds_sg" {
  name        = "capstone-rds-sg"
  description = "Allow MySQL from App tier"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.app_sg.id]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
  }

  tags = {
    Name = "capstone-rds-sg"
  }
}

# --- Database Subnet Group ---
resource "aws_db_subnet_group" "rds" {
  name       = "capstone-db-subnet-group"
  subnet_ids = aws_subnet.private[*].id

  tags = {
    Name = "capstone-db-subnet-group"
  }
}

# --- RDS Instance ---
resource "aws_db_instance" "mysql" {
  identifier             = "capstone-db"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  storage_type           = "gp2"
  db_name                = "capstone"
  username               = "admin"
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.rds.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot    = true
  publicly_accessible    = false

  tags = {
    Name = "capstone-rds-mysql"
  }
}
