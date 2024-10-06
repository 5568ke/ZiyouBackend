#ifndef RECOMMENDATION_SERVICE_IMPL_H
#define RECOMMENDATION_SERVICE_IMPL_H

#include "recommendation.grpc.pb.h"  
#include <grpcpp/grpcpp.h>
#include <grpcpp/security/server_credentials.h>
#include <iostream>
#include <fstream>

using grpc::Server;
using grpc::ServerBuilder;
using grpc::ServerContext;
using grpc::Status;

using recommendation::RecommendationRequest;
using recommendation::RecommendationResponse;
using recommendation::Recommendation;



// Service implementation
class RecommendationServiceImpl final : public Recommendation::Service {
    Status GetRecommendation(ServerContext* context, const RecommendationRequest* request,
                             RecommendationResponse* response) override {
        response->add_problemids(recommend_problem(request));
        recommand_log(request);
        return Status::OK;
    }

    int recommend_problem(const RecommendationRequest* request) {
    //  your implementation of recommendation algorithm
        return -1;
    }   

    void recommand_log(const RecommendationRequest* request) {
        std::string filename = "recommendation_log.txt";
        std::ofstream file;
        file.open(filename, std::ios::app);
        file << "version: " << request->version() << std::endl;
        file << "grade: " << request->grade() << std::endl;
        file << "chapters: " << request->chapters(0) << std::endl;
        file << "difficulties: " << request->difficulties(0) << std::endl;
        file << "numproblems: " << request->numproblems() << std::endl;
        file.close();
    }
};

#endif // RECOMMENDATION_SERVICE_IMPL_H

