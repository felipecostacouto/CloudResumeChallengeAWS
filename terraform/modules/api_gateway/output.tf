output "api_url" {
  description = "The URL of the deployed API"
  value       = aws_api_gateway_deployment.deployment.invoke_url
}
