output "lambda_function_url" {
  value = aws_lambda_function_url.url1.function_url
}

output "aws_s3_bucket" {
  value = aws_s3_bucket.main.id
}