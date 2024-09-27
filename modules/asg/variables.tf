variable "launch_configuration_name" {
  description = "Name of the launch configuration"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the launch configuration"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the launch configuration"
  type        = string
  default     = "t2.micro"
}

variable "min_size" {
  description = "Minimum number of instances in the ASG"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of instances in the ASG"
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "Desired number of instances in the ASG"
  type        = number
  default     = 1
}

variable "subnets" {
  description = "Subnets for the ASG"
  type        = list(string)
}

variable "target_group_arns" {
  description = "List of Target Group ARNs for the ASG"
  type        = list(string)
}

variable "autoscaling_group_name" {
  description = "Name of the Auto Scaling Group"
  type        = string
}

