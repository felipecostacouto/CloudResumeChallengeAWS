variable "bucket_domain_name" {
  description = "The domain name of the S3 bucket"
  type        = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "website_index_document" {
  description = "The default index document for the CloudFront distribution"
  type        = string
  default     = "index.html"
}

variable "website_error_document" {
  description = "The error document for the CloudFront distribution (e.g., error.html)"
  type        = string
  default     = "error.html"
}

variable "domain_name" {
  description = "The domain name for the website"
  type        = string
  default     = "felipecostacouto.link"
}

variable "subdomain" {
  description = "The subdomain for the website"
  type        = string
  default     = "www.felipecostacouto.link"
}

variable "route53_zone_id" {
  description = "The Route 53 Hosted Zone ID"
  type        = string
  default     = "Z02613272WL9AKG4RIX16"
}

variable "region" {
    type = string
    description = "The region in which to create/manage resources"
    default = "us-east-1"
}