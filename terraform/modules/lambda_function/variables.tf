variable "filename" {
  type = string
}

variable "function_name" {
  type = string
}

variable "role_arn" {
  type = string
}

variable "handler" {
  type = string
}

variable "runtime" {
  type = string
}

variable "source_code_hash" {
  type = string
}

variable "environment_variables" {
  type = map(string)
  default = {}
}

variable "source_arn" {
  type = string
}
