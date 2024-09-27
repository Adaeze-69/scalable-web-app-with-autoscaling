# Scalable Web App with Auto Scaling Group Using Terraform

## Overview

This project sets up a scalable web application using an Auto Scaling Group (ASG) and Load Balancer, managed through Terraform. The configuration includes:

* **Terraform**: An infrastructure as code tool that allows you to define and provision infrastructure using a high-level configuration language.
* **Auto Scaling Group (ASG)**: Automatically adjusts the number of EC2 instances to handle the load.
* **Load Balancer**: Distributes incoming application traffic across multiple targets, such as EC2 instances.

### Introduction
This project demonstrates how to set up a scalable web application using AWS Auto Scaling Group (ASG) and Load Balancer, managed through Terraform. The configuration includes:

* **Terraform**: An infrastructure as code tool that allows you to define and provision infrastructure using a high-level configuration language.
* **Auto Scaling Group (ASG)**: Automatically adjusts the number of EC2 instances to handle the load.
* **Load Balancer**: Distributes incoming application traffic across multiple targets, such as EC2 instances.


By leveraging Terraform, this project ensures a scalable, secure, and highly available web application infrastructure.

## Prerequisites

- Terraform installed on your local machine.
- AWS CLI configured with appropriate permissions.


## Project Structure

```
scalable-app
|
├── README.md
├── backend.tf
├── envs
│   └── dev
│       ├── main.tf
│       ├── terraform.tfstate
│       ├── terraform.tfstate.backup
│       ├── terraform.tfvars
│       └── variables.tf
├── modules
│   ├── asg
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── ec2
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── elb
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
└── provider.tf

````


- `main.tf`: The main Terraform configuration file.
- `variables.tf`: File to define input variables.
- `outputs.tf`: File to define output values.
- `terraform.tfvars`: File to set the values of the variables.
- `README.md`: This file.
- `.gitignore`: Git ignore file.

## Configuration Files

 `main.tf` for `envs/dev`


This file contains the main Terraform configuration for the scalable web application in the `envs/dev`.

```terraform
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


```

`variable.tf` for `envs/dev`

This file defines the variables for the scalable web application.

```terraform
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
```

*PS: Make reference to the folders and files for the terraform codes for modules (AWS ec2 instance, Autoscaling Group and Elastic Load Balancer)*

### Usage

1. **Initialize Terraform**: Run the following command to initialize Terraform.

```terraform
terraform init
```
2. **Validate Configuration**: Run the following command to validate the Terraform configuration.

```terraform
terraform validate
```
3. **Apply Configuration**: Run the following command to apply the Terraform configuration.

```terraform
terraform apply
```

### Web server Page

![web sever](image.png)


### Conclusion
This project provides a comprehensive solution for deploying a scalable web application using AWS Auto Scaling Group and Load Balancer, managed through Terraform. By leveraging Terraform's infrastructure as code capabilities, you can easily define, provision, and manage your infrastructure in a reproducible and version-controlled manner.

Key benefits of this setup include:

* **Scalability**: The Auto Scaling Group ensures that your application can handle varying levels of traffic by automatically adjusting the number of EC2 instances.
* **High Availability**: The Load Balancer distributes incoming traffic across multiple instances, ensuring high availability and reliability.
* **Manageability**: Terraform simplifies the management of your infrastructure, making it easy to apply changes and track the state of your resources.

By following this guide, you can set up a secure, scalable, and performant web application infrastructure on AWS.