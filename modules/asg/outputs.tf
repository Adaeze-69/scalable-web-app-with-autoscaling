output "autoscaling_group_name" {
  description = "Name of the Auto Scaling Group"
  value       = aws_autoscaling_group.app.name
}

output "launch_configuration_name" {
  description = "Name of the launch configuration"
  value       = aws_launch_configuration.app.name
}