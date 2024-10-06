cmake_minimum_required(VERSION 3.13)

project(RecommendationService VERSION 1.0)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

find_package(gRPC REQUIRED)
find_package(Protobuf REQUIRED)

set(PROTO_SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/protos)

include_directories(${CMAKE_CURRENT_BINARY_DIR})


add_executable(recommendation_service
    src/main.cpp
    src/recommendation_service_impl.cpp
    src/recommendation.grpc.pb.cc
    src/recommendation.pb.cc
)

target_link_libraries(recommendation_service
        gRPC::grpc++_reflection
        protobuf::libprotobuf
        grpc++_unsecure
)

target_include_directories(recommendation_service PRIVATE ${PROTO_SRC_DIR})

