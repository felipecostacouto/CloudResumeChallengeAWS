import pytest
from botocore.exceptions import ClientError
from backEnd.lambda_handler import lambda_handler

def get_counter():
    response = lambda_handler("", "")
    return response['body']

def test_counter(monkeypatch):
    visitor_count = 11

    def mock_get_item(Key):
        if Key['id'] == '0':
            return {'Item': {'id': '0', 'views': visitor_count - 1}}
        raise ClientError(
            error_response={'Error': {'Code': 'ResourceNotFoundException'}},
            operation_name='GetItem'
        )

    def mock_put_item(Item):
        return {}

    monkeypatch.setattr('backEnd.lambda_handler.table.get_item', mock_get_item)
    monkeypatch.setattr('backEnd.lambda_handler.table.put_item', mock_put_item)

    assert get_counter() == visitor_count

def test_counter_dynamodb_error(monkeypatch):
    
    def mock_get_item(Key):
        raise ClientError(
            error_response={'Error': {'Code': 'ResourceNotFoundException'}},
            operation_name='GetItem'
        )

    def mock_put_item(Item):
        return {}

    monkeypatch.setattr('backEnd.lambda_handler.table.get_item', mock_get_item)
    monkeypatch.setattr('backEnd.lambda_handler.table.put_item', mock_put_item)

    response = lambda_handler("", "")
    assert response['statusCode'] == 500
    assert 'error' in response['body']
