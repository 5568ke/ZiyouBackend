#include <iostream>
#include <memory>
#include <string>
#include <chrono>
#include <thread>
#include "recommendation_service_impl.h"
#include "recommendation.grpc.pb.h"  

using recommendation::Recommendation;
using recommendation::RecommendationRequest;
using recommendation::RecommendationResponse;
using grpc::Channel;
using grpc::ClientContext;
using grpc::Status;

void RunServer() {
    std::string server_address("0.0.0.0:50051");
    RecommendationServiceImpl service;

    ServerBuilder builder;
    // Listen on the given address without any authentication mechanism.
    builder.AddListeningPort(server_address, grpc::InsecureServerCredentials());
    // Register "service" as the instance through which we'll communicate with
    // clients. In this case it corresponds to an *synchronous* service.
    builder.RegisterService(&service);
    // Finally assemble the server.
    std::unique_ptr<Server> server(builder.BuildAndStart());
    std::cout << "Server listening on " << server_address << std::endl;

    // Wait for the server to shutdown. Note that some other thread must be
    // responsible for shutting down the server for this call to ever return.
    server->Wait();
}

// class client {
// public:
//     client(std::shared_ptr<Channel> channel)
//     : stub_(recommendation::Recommendation::NewStub(channel)) {}
//
//     std::unique_ptr<Recommendation::Stub> stub_;
//
//     std::string GetRecommendation(int user_id) {
//         // Prepare the request
//         RecommendationRequest request;
//         request.set_version(1);
//         request.set_grade(1);
//         request.add_chapters(1);
//         request.add_difficulties(1);
//         request.set_numproblems(1);
//
//         // Send the request
//         RecommendationResponse response;
//         ClientContext context;
//         Status status = stub_->GetRecommendation(&context, request, &response);
//         // Act upon its status.
//         if (status.ok()) {
//             return "ok";
//         } else {
//             return "RPC failed";
//         }
//     }
// };



int main(int argc, char** argv) {
    RunServer();
    return 0;
}

