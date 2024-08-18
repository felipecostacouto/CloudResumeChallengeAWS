output "bucket_name" {
  value = aws_s3_bucket.website_bucket.id
}

output "bucket_arn" {
  value = aws_s3_bucket.website_bucket.arn
}