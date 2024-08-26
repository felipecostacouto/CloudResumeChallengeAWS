variable "region" {
  description = "The AWS region to deploy the DynamoDB table"
  type        = string
  default     = "us-east-1"
}

variable "table_name" {
  description = "The name of the DynamoDB table"
  type        = string
  default     = "crc_dynamodb"
}

variable "tags" {
  description = "Tags to assign to the DynamoDB table"
  type        = map(string)
  default     = {
    Name = "crc_table"
  }
}
