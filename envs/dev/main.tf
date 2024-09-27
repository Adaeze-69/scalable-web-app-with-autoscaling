module "ec2" {
  source         = "../../modules/ec2"
  ami_id         = "ami-0ebfd941bbafe70c6"
  instance_type  = "t2.micro"
  instance_count = 2
  subnet_id      = "subnet-03d4d22bec92a3602"
  instance_name  = "my-ec2"
}

module "elb" {
  source               = "../../modules/elb"
  elb_name             = "my-elb"
  subnets              = ["subnet-03d4d22bec92a3602", "subnet-046c3df9b87d6c700"]
  target_group_port    = 80
  target_group_protocol = "HTTP"
  vpc_id               = "vpc-0fd2664efbb15431c"
}

module "asg" {
  source                   = "../../modules/asg"
  launch_configuration_name = "my-launch-configuration"
  depends_on = [ module.ec2 ]
  ami_id                    =  "ami-0ebfd941bbafe70c6"
  instance_type             = "t2.micro"
  min_size                  = 1
  max_size                  = 3
  desired_capacity          = 2
  subnets                   = ["subnet-03d4d22bec92a3602", "subnet-046c3df9b87d6c700"]
  target_group_arns         = [module.elb.target_group_arn]
  autoscaling_group_name    = "my-asg"
}




