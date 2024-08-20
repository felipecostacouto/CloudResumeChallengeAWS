import pytest
from unittest.mock import MagicMock
from botocore.exceptions import ClientError

from backEnd.lambda_handler import lambda_handler

@pytest.fixture
def mock_dynamodb():
    mock_dynamodb = MagicMock()
    mock_table = mock_dynamodb.Table.return_value
    mock_table.get_item.return_value = {'Item': {'views': 5}}
    return mock_dynamodb

def test_lambda_handler_success(mock_dynamodb):
    event = {}
    context = {}
    response = lambda_handler(event, context, dynamodb=mock_dynamodb)
    
    assert response['statusCode'] == 200
    assert response['body'] == 6 
    
def test_lambda_handler_dynamodb_error(mock_dynamodb):
    mock_table = mock_dynamodb.Table.return_value
    mock_table.get_item.side_effect = ClientError(
        error_response={'Error': {'Code': 'SomeError', 'Message': 'An error occurred'}},
        operation_name='GetItem'
    )

    event = {}
    context = {}
    response = lambda_handler(event, context, dynamodb=mock_dynamodb)
    
    assert response['statusCode'] == 500
    assert "error" in response['body']
