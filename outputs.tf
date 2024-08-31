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

output "bucket_name" {
  value = module.s3.bucket_name
}

output "cloudfront_distribution_id" {
  value = module.cloudfront.cloudfront_distribution_id
}