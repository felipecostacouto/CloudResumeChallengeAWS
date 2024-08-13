variable "region" {
  description = "The AWS region to deploy the DynamoDB table"
  type        = string
  default     = "us-west-2"
}

variable "table_name" {
  description = "The name of the DynamoDB table"
  type        = string
  default     = "crc_dynamodb"
}

variable "tags" {
  description = "Tags to assign to the DynamoDB table"
  type        = map(string)
  default     = {}
}
