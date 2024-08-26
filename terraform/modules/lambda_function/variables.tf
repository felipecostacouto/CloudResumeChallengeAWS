variable "region" {
  description = "The AWS region to deploy the Lambda function"
  type        = string
  default     = "us-east-1"
}

variable "lambda_name" {
  description = "The name of the Lambda function"
  type        = string
  default     = "crc_lambda"
}

variable "lambda_exec_role_name" {
  description = "The name of the Lambda execution role"
  type        = string
  default     = "lambda_exec"
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table"
  type        = string
  default     = "crc_dynamodb"
}

variable "lambda_zip_path" {
  description = "The path to the ZIP file containing the Lambda function code"
  type        = string
  default     = "./backEnd/lambda_function.zip"
}

variable "dynamodb_table_arn" {
  description = "The ARN of the DynamoDB table"
  type        = string
}