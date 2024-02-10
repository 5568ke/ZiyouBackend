import sys
sys.path.append('/usr/backend')

# backend/tests/test_api.py
from fastapi.testclient import TestClient
from src.main import backend_app

client = TestClient(backend_app)

def test_read_main():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message": "test"}
