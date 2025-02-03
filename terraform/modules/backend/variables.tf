variable "bucket_name" {
  description = "Name of the S3 bucket"
  default     = "Joel-terraform-state-backend"
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table"
  default     = "Joel-terraform-state-lock"
}