output "cloudfront_distribution_domain_name" {
  value = aws_cloudfront_distribution.cloudfront_distribution.domain_name
}

output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.cloudfront_distribution.id
}

output "origin_access_identity_s3_canonical_user_id" {
  value = aws_cloudfront_origin_access_identity.origin_access_identity.s3_canonical_user_id
}
