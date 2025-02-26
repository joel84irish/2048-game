variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "tm"
}

variable "domain_name" {
  default     = "joelirish.app"
  description = "The domain name to use for the project"
  type        = string
}

variable "ecr_repo_url" {
  description = "The URL of the ECR repository"
  default     = "980921749029.dkr.ecr.us-west-2.amazonaws.com/threat-model"
  type        = string
}

variable "aws_region" {
  default     = "us-west-2"
  description = "The AWS region to deploy to"
  type        = string
}

variable "container_port" {
  description = "The port the container exposes"
  type        = number
  default     = 3000
}

variable "desired_count" {
  description = "The desired number of tasks running in the ECS service"
  type        = number
  default     = 1
}
