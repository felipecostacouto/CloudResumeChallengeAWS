# Terraform backend configuration to use a separate S3 bucket for state
terraform {
  backend "s3" {
    bucket         = module.s3.state_bucket_name
    key            = "terraform/state.tfstate"
    region         = var.region
  }
}

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
  lambda_zip_path      = "./backEnd/lambda_function.zip"

  dynamodb_table_name  = module.dynamo_db.dynamodb_table_name
  dynamodb_table_arn   = module.dynamo_db.dynamodb_table_arn
}

module "api_gateway" {
  source               = "./terraform/modules/api_gateway"
  region               = var.region
  lambda_function_name = module.lambda_function.lambda_function_name
  lambda_function_arn  = module.lambda_function.lambda_function_arn
  api_name             = "crc_api"
  api_description      = "API for CRC Lambda"
  api_path_part        = "{proxy+}"
  http_method          = "POST"
}

module "s3" {
  source                  = "./terraform/modules/s3"
  bucket_name             = var.bucket_name
  index_html_path         = "./frontEnd/index.html"
  error_html_path         = "./frontEnd/error.html"
  script_js_path          = "./frontEnd/script.js"
  style_css_path          = "./frontEnd/style.css"
  assets_path             = "./frontEnd/assets"
  origin_access_identity_s3_canonical_user_id = module.cloudfront.origin_access_identity_s3_canonical_user_id
}

module "cloudfront" {
  source                  = "./terraform/modules/cloudfront"
  bucket_domain_name      = module.s3.bucket_regional_domain_name
  bucket_name             = module.s3.bucket_name
  website_index_document  = var.website_index_document
}

