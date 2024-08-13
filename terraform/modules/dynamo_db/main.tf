resource "aws_dynamodb_table" "table" {
  name           = var.table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = var.tags
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.table.name
}

output "dynamodb_table_arn" {
  value = aws_dynamodb_table.table.arn
}
