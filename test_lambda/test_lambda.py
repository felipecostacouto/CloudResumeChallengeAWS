from backEnd.lambda_handler import lambda_handler

def get_counter():
    response = lambda_handler("", "")
    return response.json()['body']

def test_counter(monkeypatch):
    visitor_count = 11

    class MockResponse:
        def __init__(self, body):
            self.body = body
        
        def json(self):
            return self.body

    monkeypatch.setattr(
        'backEnd.lambda_handler.lambda_handler', 
        lambda *args, **kwargs: MockResponse({'body': visitor_count})
    )

    assert get_counter() == visitor_count
