#!/bin/bash

echo "Compiling .proto files..."
python -m grpc_tools.protoc -I/usr/backend/protos --python_out=/usr/backend/proto_python_file --grpc_python_out=/usr/backend/proto_python_file /usr/backend/protos/*.proto

