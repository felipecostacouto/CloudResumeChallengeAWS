import json
import boto3
from botocore.exceptions import ClientError

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table("crc_dynamodb")

def lambda_handler(event, context):
    try:
        
        response = table.get_item(Key={
            'id':'0'
        })

        views_count = response['Item']['views']
        views_count += 1
        
        print(views_count)
        
        response = table.put_item(Item={
            'id':'0',
            'views': views_count
        })
        

        response = {
            "statusCode": 200,
            "headers": {
                "Content-Type": "application/json",
                "Access-Control-Allow-Headers": "Content-Type",
                "Access-Control-Allow-Origin": "*",
                "Access-Control-Allow-Methods": "OPTIONS,POST,GET",
            },
            "body": views_count
        }

    except ClientError as e:
        # Handle DynamoDB errors
        response = {
            "statusCode": 500,
            "headers": {
                "Content-Type": "application/json",
                "Access-Control-Allow-Headers": "Content-Type",
                "Access-Control-Allow-Origin": "*",
                "Access-Control-Allow-Methods": "OPTIONS,POST,GET",
            },
            "body": json.dumps({"error": str(e)})
        }

    return response
