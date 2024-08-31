variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "crc-project-1402ab"
}

variable "index_html_path" {
  description = "The path to the index.html file"
  type        = string
  default     = "./frontEnd/index.html"
}

variable "error_html_path" {
  description = "The path to the error.html file"
  type        = string
  default     = "./frontEnd/error.html"
}

variable "script_js_path" {
  description = "The path to the script.js file"
  type        = string
  default     = "./frontEnd/script.js"
}

variable "style_css_path" {
  description = "The path to the style.css file"
  type        = string
  default     = "./frontEnd/style.css"
}

variable "assets_path" {
  description = "The path to the assets directory"
  type        = string
  default     = "./frontEnd/assets"
}

variable "content_type_mapping" {
  description = "Mapping of file extensions to content types"
  type        = map(string)
  default = {
    ".html" = "text/html"
    ".css"  = "text/css"
    ".js"   = "text/javascript"
    ".png"  = "image/png"
    ".jpg"  = "image/jpeg"
    ".gif"  = "image/gif"
    ".pdf"  = "application/pdf"
  }
}

variable "origin_access_identity_s3_canonical_user_id" {
  description = "The canonical user ID for the CloudFront origin access identity"
  type        = string
}

variable "state_bucket_name" {
  description = "The name of the S3 bucket used for storing Terraform state files"
  type        = string
  default     = "crc-project-1402ab-tfstate"
}