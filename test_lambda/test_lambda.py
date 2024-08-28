import pytest
import boto3
from unittest.mock import MagicMock, patch
from botocore.exceptions import ClientError
from backEnd.lambda_handler import lambda_handler

@patch('boto3.resource')
def test_lambda_handler_success(mock_boto3_resource):
    # Mock DynamoDB setup
    mock_dynamodb = MagicMock()
    mock_table = MagicMock()
    mock_boto3_resource.return_value = mock_dynamodb
    mock_dynamodb.Table.return_value = mock_table
    
    # Mock the put_item and get_item methods
    mock_table.get_item.return_value = {'Item': {'id': '0', 'views': 10}}
    mock_table.put_item.return_value = None

    event = {}
    context = {}

    response = lambda_handler(event, context)

    assert response['statusCode'] == 200
    assert response['body'] == 11  # Since we start with 10 and increment by 1

@patch('boto3.resource')
def test_lambda_handler_dynamodb_error(mock_boto3_resource):
    # Mock DynamoDB setup
    mock_dynamodb = MagicMock()
    mock_table = MagicMock()
    mock_boto3_resource.return_value = mock_dynamodb
    mock_dynamodb.Table.return_value = mock_table
    
    # Mock the get_item method to raise a ClientError
    mock_table.get_item.side_effect = ClientError(
        error_response={
            'Error': {
                'Code': '500',
                'Message': 'DynamoDB error'
            }
        },
        operation_name='GetItem'
    )

    event = {}
    context = {}

    response = lambda_handler(event, context)

    assert response['statusCode'] == 500
    assert 'error' in response['body']
