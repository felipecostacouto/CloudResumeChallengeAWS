variable "bucket_name" {
    description = "Bucket name for s3"
    default = "cloudResumeChallenge-bucket-1402ab"
}

variable "website_index_document" {
    description = "Website index document"
    default = "index.html"
}

variable "assets_path" {
    description = "Path to assets folder"
    default = "./assets"
}