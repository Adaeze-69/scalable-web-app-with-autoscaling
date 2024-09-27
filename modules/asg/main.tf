resource "aws_launch_configuration" "app" {
  name          = var.launch_configuration_name
  image_id      = var.ami_id
  instance_type = var.instance_type

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "app" {
  launch_configuration = aws_launch_configuration.app.id
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
  vpc_zone_identifier  = var.subnets
  target_group_arns    = var.target_group_arns

  tag {
    key                 = "Name"
    value               = var.autoscaling_group_name
    propagate_at_launch = true
  }
}