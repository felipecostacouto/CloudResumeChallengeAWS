import json
import boto3
from botocore.exceptions import ClientError

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table("crc_dynamodb")

def lambda_handler(event, context):
    headers = {
        "Content-Type": "application/json",
        "Access-Control-Allow-Headers": "Content-Type",
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "POST, OPTIONS",
    }
    
    try:
        response = table.get_item(Key={'id': '0'})
        views_count = response['Item']['views']
        views_count += 1
        
        table.put_item(Item={'id': '0', 'views': views_count})

        return {
            "statusCode": 200,
            "headers": headers,
            "body": json.dumps({"views": views_count})
        }

    except ClientError as e:
        return {
            "statusCode": 500,
            "headers": headers,
            "body": json.dumps({"error": str(e)})
        }
