variable "region" {
  description = "The AWS region to deploy the Lambda function"
  type        = string
  default     = "us-west-2"
}

variable "lambda_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "lambda_exec_role_name" {
  description = "The name of the Lambda execution role"
  type        = string
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table"
  type        = string
}