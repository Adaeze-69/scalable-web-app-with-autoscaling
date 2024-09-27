resource "aws_lb" "app" {
  name               = var.elb_name
  internal           = var.internal
  load_balancer_type = "application"
  subnets            = var.subnets

  tags = {
    Name = var.elb_name
  }
}

resource "aws_lb_target_group" "app" {
  name     = "${var.elb_name}-target-group"
  port     = var.target_group_port
  protocol = var.target_group_protocol
  vpc_id   = var.vpc_id
}