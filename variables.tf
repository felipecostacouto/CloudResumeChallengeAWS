variable "region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "lambda_name" {
  description = "Lambda function name"
  default     = "crc_lambda_function"
}

variable "lambda_exec_role_name" {
  description = "Execution role name for Lambda"
  default     = "crc_lambda_execution_role"
}

variable "bucket_name" {
  description = "Bucket name for S3"
  default     = "cloudResumeChallenge-bucket-1402ab"
}

variable "website_index_document" {
  description = "Website index document"
  default     = "index.html"
}
