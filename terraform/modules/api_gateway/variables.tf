variable "region" {
  description = "The AWS region to deploy the API Gateway"
  type        = string
  default     = "sa-east-1"
}

variable "api_name" {
  description = "The name of the API Gateway"
  type        = string
  default     = "my-api-resume-challenge"
}

variable "api_description" {
  description = "The description of the API Gateway"
  type        = string
  default     = "API for Cloud Resume Challenge"
}

variable "api_path_part" {
  description = "The path part of the API resource"
  type        = string
  default     = "my-resource"
}

variable "http_method" {
  description = "The HTTP method for the API method"
  type        = string
  default     = "POST"
}

