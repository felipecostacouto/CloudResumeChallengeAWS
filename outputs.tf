output "api_url" {
  value = module.api_gateway.api_url
}

output "lambda_function_name" {
  value = module.lambda_function.lambda_function_name
}

output "dynamodb_table_arn" {
  value = module.dynamo_db.dynamodb_table_arn
}

output "lambda_function_arn" {
  value = module.lambda_function.lambda_function_arn
}
