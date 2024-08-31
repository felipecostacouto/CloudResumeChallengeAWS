resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.id
  key    = "index.html"
  source = var.index_html_path
  etag   = filemd5(var.index_html_path)
  content_type = "text/html"
}

resource "aws_s3_object" "error_html" {
  bucket = aws_s3_bucket.website_bucket.id
  key    = "error.html"
  source = var.error_html_path
  etag   = filemd5(var.error_html_path)
  content_type = "text/html"
}

resource "aws_s3_object" "script_js" {
  bucket = aws_s3_bucket.website_bucket.id
  key    = "script.js"
  source = var.script_js_path
  etag   = filemd5(var.script_js_path)
  content_type = "text/javascript"
}

resource "aws_s3_object" "style_css" {
  bucket = aws_s3_bucket.website_bucket.id
  key    = "style.css"
  source = var.style_css_path
  etag   = filemd5(var.style_css_path)
  content_type = "text/css"
}

# Upload asset files to S3
resource "aws_s3_object" "assets" {
  for_each    = fileset(var.assets_path, "**/*")
  bucket      = aws_s3_bucket.website_bucket.id
  key         = "assets/${each.value}"
  source      = "${var.assets_path}/${each.value}"
  etag        = filemd5("${var.assets_path}/${each.value}")
  content_type = lookup(var.content_type_mapping, regex("([^.]*)$", each.value)[0], "application/octet-stream")
}

resource "aws_s3_bucket_policy" "website_bucket_policy" {
  bucket = aws_s3_bucket.website_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          CanonicalUser = var.origin_access_identity_s3_canonical_user_id
        }
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.website_bucket.arn}/*"
      }
    ]
  })
}