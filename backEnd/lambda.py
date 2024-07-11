import json
import boto3
from botocore.exceptions import ClientError

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table("crc_dynamodb")

def lambda_handler(event, context):
    try:
        # Update the item and increment the views attribute atomically
        response = table.update_item(
            Key={'id': '0'},
            UpdateExpression="SET views = if_not_exists(views, :start) + :inc",
            ExpressionAttributeValues={
                ':start': 0,
                ':inc': 1
            },
            ReturnValues="UPDATED_NEW"
        )

        views_count = response['Attributes']['views']
        data = {"views": views_count}

        response = {
            "statusCode": 200,
            "body": json.dumps(data),
            "headers": {
                "Content-Type": "application/json",
                "Access-Control-Allow-Headers": "Content-Type",
                "Access-Control-Allow-Origin": "*",
                "Access-Control-Allow-Methods": "OPTIONS,GET",
            },
        }

    except ClientError as e:
        # Handle DynamoDB errors
        response = {
            "statusCode": 500,
            "body": json.dumps({"error": str(e)}),
            "headers": {
                "Content-Type": "application/json",
                "Access-Control-Allow-Headers": "Content-Type",
                "Access-Control-Allow-Origin": "*",
                "Access-Control-Allow-Methods": "OPTIONS,GET",
            },
        }

    return response
