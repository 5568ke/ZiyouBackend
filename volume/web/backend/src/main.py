import uvicorn
import fastapi
from .db.session import engine
from .models import Base
from .api import routes 


def initialize_backend_application() -> fastapi.FastAPI:
    app = fastapi.FastAPI()  
    app.include_router(router=routes.router)
    return app


backend_app: fastapi.FastAPI = initialize_backend_application()

if __name__ == "__main__":
    uvicorn.run(
        app="src.main:backend_app",
    )
