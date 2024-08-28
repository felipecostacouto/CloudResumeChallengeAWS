import pytest
from moto import mock_dynamodb
import boto3
from botocore.exceptions import ClientError
from backEnd.lambda_handler import lambda_handler

@mock_dynamodb
def setup_dynamodb():
    # Set up the mock DynamoDB table
    dynamodb = boto3.resource('dynamodb', region_name='us-east-1')
    table = dynamodb.create_table(
        TableName='crc_dynamodb',
        KeySchema=[
            {
                'AttributeName': 'id',
                'KeyType': 'HASH'
            }
        ],
        AttributeDefinitions=[
            {
                'AttributeName': 'id',
                'AttributeType': 'S'
            }
        ],
        ProvisionedThroughput={
            'ReadCapacityUnits': 5,
            'WriteCapacityUnits': 5
        }
    )

    # Add an initial item to the table
    table.put_item(Item={
        'id': '0',
        'views': 10
    })

    return table

@mock_dynamodb
def test_lambda_handler_success():
    setup_dynamodb()

    event = {}  # Event and context are empty for this test
    context = {}

    response = lambda_handler(event, context)

    assert response['statusCode'] == 200
    assert response['body'] == 11  # Since we start with 10 and increment by 1

@mock_dynamodb
def test_lambda_handler_dynamodb_error(monkeypatch):
    def mock_get_item(Key):
        raise ClientError(
            error_response={
                'Error': {
                    'Code': '500',
                    'Message': 'DynamoDB error'
                }
            },
            operation_name='GetItem'
        )

    # Monkeypatch the table's get_item method to simulate an error
    monkeypatch.setattr(
        'backEnd.lambda_handler.table.get_item',
        mock_get_item
    )

    event = {}
    context = {}

    response = lambda_handler(event, context)

    assert response['statusCode'] == 500
    assert 'error' in json.loads(response['body'])
