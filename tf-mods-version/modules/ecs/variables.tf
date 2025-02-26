variable "cluster_name" {
  description = "Name of the ECS cluster"
  default     = "joel-sandbox"
}

variable "task_family" {
  description = "Family name of the ECS task definition"
  default     = "tm"
}

variable "task_cpu" {
  description = "CPU units for the ECS task"
  default     = "1024"
}

variable "task_memory" {
  description = "Memory for the ECS task"
  default     = "3072"
}

variable "container_name" {
  description = "Name of the container"
  default     = "tmc"
}

variable "ecr_repo_url" {
  description = "URL of the ECR repository"
}

variable "image_tag" {
  description = "Tag of the container image"
  default     = "latest"
}

variable "container_port" {
  description = "Port exposed by the container"
  default     = 3000
}

variable "aws_region" {
  description = "AWS region"
}

variable "cpu_architecture" {
  description = "CPU architecture for the task"
  default     = "ARM64"
}

variable "os_family" {
  description = "Operating system family for the task"
  default     = "LINUX"
}

variable "service_name" {
  description = "Name of the ECS service"
  default     = "tm-service"
}

variable "desired_count" {
  description = "Desired number of tasks running in the service"
  default     = 1
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ECS service"
  type        = list(string)
}

variable "ecs_tasks_sg_id" {
  description = "ID of the ECS tasks security group"
}

variable "target_group_arn" {
  description = "ARN of the ALB target group"
}
