output "s3_bucket_name" {
    value = aws_s3_bucket.website_bucket.id
}

output "cloudfront_distribution_domain_name" {
    value = aws_cloudfront_distribution.cloudfront_distribution.domain_name
}

output "api_url" {
  value = module.api_gateway.api_url
}

output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.cloudfront_distribution.id
}