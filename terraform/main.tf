module "dynamo_db" {
  source = "./terraform/modules/dynamo_db"

  region     = var.region
  table_name = "crc_dynamodb"
  tags = {
    Environment = "Prod"
    Project     = "crc"
  }
}

module "lambda_function" {
  source               = "./terraform/modules/lambda_function"
  region               = var.region
  lambda_name          = var.lambda_name
  lambda_exec_role_name = var.lambda_exec_role_name
  lambda_zip_path      = "path/to/your/lambda_function.zip"
  dynamodb_table_name  = module.dynamodb.dynamodb_table_name
  dynamodb_table_arn   = module.dynamodb.dynamodb_table_arn
  api_gateway_rest_api_arn = module.api_gateway.api_gateway_rest_api_arn
}

module "api_gateway" {
  source               = "./terraform/modules/api_gateway"
  region               = var.region
  lambda_function_arn  = module.lambda_function.lambda_function_arn
  api_name             = "crc_api"
  api_description      = "API for CRC Lambda"
  api_path_part        = "{proxy+}"
  http_method          = "POST"
}

# Create S3 bucket
resource "aws_s3_bucket" "website_bucket" {
    bucket = var.bucket_name
}

resource "aws_s3_object" "index_html" {
    bucket = aws_s3_bucket.website_bucket.id
    key = "index.html"
    source = "./frontEnd/index.html"
    etag = filemd5("./frontEnd/index.html")
    content_type = "text/html"
}

resource "aws_s3_object" "error_html" {
    bucket = aws_s3_bucket.website_bucket.id
    key = "error.html"
    source = "./frontEnd/error.html"
    etag = filemd5("./frontEnd/error.html")
    content_type = "text/html"
}

resource "aws_s3_object" "script_js" {
    bucket = aws_s3_bucket.website_bucket.id
    key = "script.js"
    source = "./frontEnd/script.js"
    etag = filemd5("./frontEnd/script.js")
    content_type = "text/javascript"
}

resource "aws_s3_object" "style_css" {
    bucket = aws_s3_bucket.website_bucket.id
    key = "style.css"
    source = "./frontEnd/style.css"
    etag = filemd5("./frontEnd/style.css")
    content_type = "text/css"
}

# Get all files in the assets directory
locals {
  asset_files = fileset(var.assets_path, "**/*")
}

resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
    comment = "Origin Access Identity for static website"
}

resource "aws_cloudfront_distribution" "cloudfront_distribution" {
    origin {
        domain_name = aws_s3_bucket.website_bucket.bucket_regional_domain_name
        origin_id = var.bucket_name
    

        s3_origin_config {
            origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.aws_cloudfront_access_identity_path
        }
    }
    enabled = true
    is_ipv6_enabled = true
    default_root_object = var.website_index_document

    default_cache_behavior {
        allowed_methods  = ["GET", "HEAD"]
        cached_methods   = ["GET", "HEAD"]
        target_origin_id = var.bucket_name
    

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
    }

    viewer_certificate {
        cloudfront_default_certificate = true
    }

    restrictions {
      geo_restriction {
        restriction_type = "none"
      }
    }

    tags = {
        Name = "Cloudfront Distribution"
        Environment = "Dev"
    }
}

resource "aws_s3_bucket_policy" "website_bucket_policy" {
    bucket = aws_s3_bucket.website_bucket.id

    policy = jsondecode({
        Statement = [
            {
                Action = "S3: GetObject"
                Effect = "Allow"
                Resource = "${aws_s3_bucket.website_bucket.arn}/*"
                Principal = {
                    CanonicalUser = aws_cloudfront_origin_access_identity.origin_access_identity.s3_canonical_user_id
                }
            }
        ]
    })
}

