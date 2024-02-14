#!/bin/bash
# entrypoint.sh

# compile .proto file
echo "Compiling .proto files..."
protoc --proto_path=/app/protos --cpp_out=/app/recommendation_system/src --grpc_out=/app/recommendation_system/src --plugin=protoc-gen-grpc=`which grpc_cpp_plugin` /app/protos/*.proto

compile C++ file
echo "Compiling C++ service..."
cd /app/recommendation_system || exit
rm -rf build
mkdir build && cd build
cmake .. 
cmake --build .

echo "Starting the recommendation service..."
exec /app/recommendation_system/build/recommendation_service
