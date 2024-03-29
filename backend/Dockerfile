# Pull official latest Python Docker image (Pulished with version 3.11.0)
FROM --platform=linux/amd64 python:latest

# Set the working directory
WORKDIR /usr/backend

# Set up Python behaviour
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV VIRTUAL_ENV=/opt/venv

# Switch on virtual environment
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install Python dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt ./
RUN pip3 install -r requirements.txt

# Set the server port
EXPOSE 8000

# Copy all files
COPY . .

# RUN chmod +x /usr/backend/entrypoint.sh
# ENTRYPOINT ["/usr/backend/entrypoint.sh"]

# Start up the backend server
CMD uvicorn src.main:backend_app --reload --workers 4 --host 0.0.0.0 --port 8000
