
output "cloudfront_url" {
  description = "CloudFront Distribution URL"
  value       = aws_cloudfront_distribution.cdn.domain_name
  
}