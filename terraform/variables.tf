# Define AWS region
variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "eu-north-1"
}

# Define the S3 bucket name (must be globally unique)
variable "bucket_name" {
  description = "Unique name for the S3 bucket"
  type        = string
}
