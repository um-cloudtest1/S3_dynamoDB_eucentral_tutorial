output "bucket" {
  description = "The S3 bucket to use as Terraform Backend"
  value       = "${aws_s3_bucket.umcs.id}"
}

output "lock_table" {
  description = "The DynamoDb table for S3 backend locking"
  value       = "${aws_dynamodb_table.umcs_lock.id}"
}
