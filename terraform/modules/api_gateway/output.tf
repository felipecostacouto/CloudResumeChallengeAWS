output "api_url" {
  description = "The URL of the deployed API"
  value = "https://${aws_api_gateway_rest_api.api.id}.execute-api.${var.region}.amazonaws.com/${aws_api_gateway_deployment.deployment.stage_name}"
}

