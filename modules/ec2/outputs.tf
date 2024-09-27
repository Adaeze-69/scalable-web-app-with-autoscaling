output "instance_ids" {
  description = "IDs of the EC2 instances"
  value       = aws_instance.app.*.id
}

output "private_ips" {
  description = "Private IPs of the EC2 instances"
  value       = aws_instance.app.*.private_ip
}