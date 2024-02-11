import sys
sys.path.append('/usr/backend')

## for github action
sys.path.append('/home/runner/work/ZiyouBackend/ZiyouBackend/backend')

from fastapi.testclient import TestClient
from src.main import backend_app as backend_app

client = TestClient(backend_app)

def test_read_main():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message": "test"}

