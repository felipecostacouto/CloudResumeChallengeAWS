variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "crc_project_1402ab" 
}

variable "domain_name" {
  description = "The domain name for the website"
  type        = string
  default     = "www.felipecostacouto.link"
}

variable "route53_zone_id" {
  description = "The Route 53 Hosted Zone ID"
  type        = string
  default     = "Z02613272WL9AKG4RIX16"
}
