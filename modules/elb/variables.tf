variable "elb_name" {
  description = "Name of the ELB"
  type        = string
}

variable "internal" {
  description = "Whether the ELB is internal or external"
  type        = bool
  default     = false
}

variable "subnets" {
  description = "Subnets for the ELB"
  type        = list(string)
}

variable "target_group_port" {
  description = "Port for the ELB target group"
  type        = number
  default     = 80
}

variable "target_group_protocol" {
  description = "Protocol for the ELB target group"
  type        = string
  default     = "HTTP"
}

variable "vpc_id" {
  description = "VPC ID for the ELB"
  type        = string
}