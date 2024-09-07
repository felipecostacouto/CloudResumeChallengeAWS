output "api_url" {
  description = "The URL of the deployed API"
  value       = "${aws_api_gateway_deployment.deployment.invoke_url}${aws_api_gateway_stage.prod_stage.stage_name}/${aws_api_gateway_resource.resource.path_part}"
}
