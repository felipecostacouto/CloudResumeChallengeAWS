import pytest
from unittest.mock import patch, MagicMock
from botocore.exceptions import ClientError

from backEnd import lambda_handler

@pytest.fixture
def mock_dynamodb_table():

    with patch('backEnd.dynamodb.Table') as mock_table:
        yield mock_table

def test_lambda_handler_success(mock_dynamodb_table):

    mock_table_instance = mock_dynamodb_table.return_value
    mock_table_instance.get_item.return_value = {'Item': {'views': 5}}
    
    event = {}
    context = {}
    response = lambda_handler(event, context)
    
    # Verify that the response has the correct view count
    assert response['statusCode'] == 200
    assert response['body'] == 6  # Since the view count should be incremented by 1

def test_lambda_handler_dynamodb_error(mock_dynamodb_table):
    
    mock_table_instance = mock_dynamodb_table.return_value
    mock_table_instance.get_item.side_effect = ClientError(
        error_response={'Error': {'Code': 'SomeError', 'Message': 'An error occurred'}},
        operation_name='GetItem'
    )

    event = {}
    context = {}
    response = lambda_handler(event, context)

    # Verify that the response indicates an error
    assert response['statusCode'] == 500
    assert "error" in response['body']  # Check if an error message is in the body
