variable "vpc_id" {
  description = "The VPC ID where resources will be created"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID to use for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "The instance type to use for EC2 instances"
  type        = string
  default     = "t2.micro"
}

variable "availability_zones" {
  description = "A list of availability zones to launch resources in"
  type        = list(string)
}

variable "subnet_ids" {
  description = "A list of subnet IDs to launch resources in"
  type        = list(string)
}

variable "min_size" {
  description = "The minimum size of the Auto Scaling group"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "The maximum size of the Auto Scaling group"
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "The desired capacity of the Auto Scaling group"
  type        = number
  default     = 2
}