output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = aws_lb.app.dns_name
}

output "frontend_public_ip" {
  description = "Public IP of the Frontend Nginx EC2 instance"
  value       = aws_instance.frontend.public_ip
}

output "db_endpoint" {
  description = "RDS MySQL Endpoint URI"
  value       = split(":", aws_db_instance.mysql.endpoint)[0]
}
