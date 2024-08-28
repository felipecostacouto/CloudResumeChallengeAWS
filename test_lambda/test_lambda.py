from backEnd.lambda_handler import lambda_handler

def get_counter():
    response = lambda_handler("", "")
    return response['body']  # No need to call .json() since response is a dict

def test_counter(monkeypatch):
    visitor_count = 11

    class MockResponse:
        def __init__(self, body):
            self.body = body
        
        # Adjust json() to directly return the body since the original function expects a dict
        def __call__(self):
            return {'body': self.body}

    monkeypatch.setattr(
        'backEnd.lambda_handler.lambda_handler', 
        lambda *args, **kwargs: MockResponse(visitor_count)()
    )

    assert get_counter() == visitor_count
