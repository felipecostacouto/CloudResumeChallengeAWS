resource "aws_dynamodb_table" "crc_table" {
  name           = var.table_name
  billing_mode   = "PROVISIONED"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }

  read_capacity  = 1
  write_capacity = 1

  tags = var.tags
}

resource "aws_dynamodb_table_item" "dynamodb_table_item" {
  table_name = aws_dynamodb_table.crc_table.name
  hash_key   = aws_dynamodb_table.crc_table.hash_key

  item = <<ITEM
  {
    "id": {"S": "0"},
    "views": {"N": "0"}
  }
  ITEM
}

