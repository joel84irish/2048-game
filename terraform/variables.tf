
variable "region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-west-2"
}

variable "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  type        = string 
  default     = "2048_game"
}

variable "app_name" {
  description = "The name of the application"
  type        = string
  default     = "game"
}

variable "vpc_id" {
  description = "The ID of the VPC where resources will be created"
  type        = string
  default     = "vpc-0b723100be1e9fcd8"
}

variable "subnet_ids" {
  description = "A list of subnet IDs for the ECS service"
  type        = list(string)
  default     = ["subnet-0f5363c096e7e0dcb", "subnet-0cef58dcd74410f37"]
}

variable "dynamodb_table_name" {
  description = "The name of the application"
  type        = string
  default     = "joel-DB"
}
