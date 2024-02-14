![example workflow](https://github.com/5568ke/ZiyouBackend/actions/workflows/ci.yml/badge.svg)

# Ziyou Backend Project

## Introduction
Ziyou Backend is a backend service framework specifically designed to receive requests and call C++ executables to generate and return problem PDFs. It aims to offer flexibility in development and reliability in the future.Utilizing fastapi, Docker containerization, automated testing, and Continuous Integration/Continuous Deployment (CI/CD) strategies 
## Installation Guide
1. **Prerequisites**: Ensure your system has Docker and Docker Compose installed.
2. **Clone the Project**: Use the git command to clone the project to your local machine.
    ```
    git clone https://example.com/ZiyouBackend-master.git
    ```
3. **Environment Setup**: Navigate to the project directory and modify environment variables in the `.env` file as necessary.

## Usage Instructions
1. **Start Services**: In the project's root directory, run the following command to start all services:
    ```
    docker-compose up -d
    ```
2. **Run Tests**: Execute the unit tests with the following command:
    ```
    python test.py
    ```

## Docker Support
This project includes a `docker-compose.yml` file, defining the services required by the project. This allows for easy management and operation of multiple containers for the project using Docker Compose.

## Development Workflow
1. **Clone the project** to your local machine as shown in the Installation Guide.
2. **Create a new branch** for your feature or bug fix (`git checkout -b feature/YourFeatureName`).
3. **Make changes** and **commit** them to your branch (`git commit -am "Add your feature"`).
4. **Push your branch** to the repository (`git push origin feature/YourFeatureName`).
5. Discuss with the team and **merge your changes** into the main branch once approved.

## Integration with C++ Recommendation System via gRPC

The Ziyou Backend integrates with a C++ written recommendation system through gRPC. This setup allows the FastAPI web backend to efficiently communicate with the recommendation engine, leveraging gRPC for type-safe, low-latency inter-service communication.

### C++ Recommendation System

Located under `recommendation_system/src`, the C++ recommendation system exposes several gRPC services that the FastAPI backend consumes. Here's an overview of the gRPC services provided and where to find their implementations:

- **Service Implementation**: `recommendation_system/src/recommendation_service_impl.cpp`
  - This file contains the implementation of the recommendation system's gRPC service. It's where the logic for processing incoming requests and generating responses resides.

- **Protobuf Definitions**: `protos/recommendation.proto`
  - Shared Protobuf file defining the data structures and gRPC services used by both the C++ recommendation system and the FastAPI backend.
### Implementation Details

The core of the recommendation logic in the C++ system is found in the `RecommendationServiceImpl` class, specifically in the method `GetRecommendation`. Below is the crucial segment that developers are expected to modify to implement or enhance the recommendation logic:

```cpp
// recommendation_service_impl.cpp

#include "recommendation_service_impl.h"

// Service implementation
class RecommendationServiceImpl final : public Recommendation::Service {
    Status GetRecommendation(ServerContext* context, const RecommendationRequest* request,
                             RecommendationResponse* response) override {
        response->add_problemids(recommend_problem(request));
        recommand_log(request);
        return Status::OK;
    }

    int recommend_problem(const RecommendationRequest* request) {
        // Your implementation of recommendation algorithm
        return -1;
    }   
};
```
Developers working on the recommendation system should focus on modifying `recommendation_service_impl.cpp` to adjust the logic as per the project's requirements. Additionally, any changes to the Protobuf definitions should be reflected in `recommendation.proto`, and the corresponding gRPC stubs must be regenerated for both C++ and Python.

### Python FastAPI Backend

The FastAPI backend interacts with the recommendation system through gRPC, with client-side code located in `backend/src/service/recommendation_service`.

- **gRPC Client Implementation**: `backend/src/service/recommendation_service`
  - Contains the Python gRPC client that calls into the C++ recommendation system. It's responsible for constructing requests, handling responses, and processing any errors.
```python
class RecommendationService:
    def __init__(self):
        self.grpc_server_address = 'recommendation:50051' 

    def get_recommendations(self, request: ProblemRequest) -> List[int]:
        with grpc.insecure_channel(self.grpc_server_address) as channel:
            stub = recommendation_pb2_grpc.RecommendationStub(channel)
            request = recommendation_pb2.RecommendationRequest(
                version=request.version,
                grade=request.grade,
                chapters=request.chapter,
                difficulties=request.difficulty,
                numProblems=request.fill_in_blanks_count
            )
            response = stub.GetRecommendation(request)
            print(response.problemIds)
            print("test")
        return response
```

### To develop recommendation_system on top of the existing framework:

1. **C++ Developers**: Focus on `recommendation_system/src` for implementing recommendation logic. Refer to [gRPC C++ Tutorial](https://grpc.io/docs/languages/cpp/basics/) for guidance on working with gRPC in C++.

2. **Python Developers**: Modify `backend/src/service/recommendation_service` to adjust how the FastAPI backend communicates with the C++ system. Consult the [gRPC Python Tutorial](https://grpc.io/docs/languages/python/basics/) for more information on using gRPC with Python.

For a seamless development experience, ensure that both C++ and Python components are kept in sync, especially regarding changes to Protobuf definitions.

## Version Control
This project is version-controlled with Git. You can view the available versions in the project's [repository](https://example.com/ZiyouBackend-master).


## To-Do Features
- :white_check_mark: **Understanding the Old Web Backend Behavior**
- :white_check_mark: **Migrating Data from the Old Database to the New Design**
  - **Note**: Migration of junior high school data is temporarily halted due to suspected non-existent chapters (potentially due to user input errors).
- :white_check_mark: **Integrate with a C++ backend system for question Recommendation System**
  - **Supplement**: Communication with the C++ backend via gRPC has been established, allowing developers to build on the existing framework without the need for additional networking libraries. Currently awaiting further implementation of the recommendation algorithm.
- :arrow_forward: **Designing the Question Generation API**   (Progress temporarily paused)
  - **Supplement**: The basic API (resembling the old 小學堂 quick question generation) has been completed. Awaiting further API requirements from the frontend .
- :arrow_forward: **PDF Output Adjustment via Parameters**  (Halfway done, progress temporarily paused)
  - **Supplement**: Awaiting an update to the LaTeX compiler before implementation in the web backend can proceed. 
- :calendar: **Integration with Educational Cloud (教育雲) Accounts**
- :calendar: **Integration with Vue.js Frontend**: 
  - **Supplement**: API that allows administrative staff to update question type data via a UI interface.
- :calendar: **Integration with the 小學堂 Mobile App** 
- :calendar: **Establish continuous deployment workflows**
- :calendar: **Comprehensive Unit Testing**
- :calendar: **Set up Redis for enhanced caching and session management (Potential Requirement)** 
- :calendar: **抓下一個倒楣鬼進來坐牢**



## mascot :sos: :sos: :sos:
```

                       _oo0oo_
                      o8888888o
                      88" . "88
                      (| -_- |)
                      0\  =  /0
                    ___/`---'\___
                  .' \\|     |// '.
                 / \\|||  :  |||// \
                / _||||| -:- |||||- \
               |   | \\\  -  /// |   |
               | \_|  ''\---/''  |_/ |
               \  .-\__  '-'  ___/-. /
             ___'. .'  /--.--\  `. .'___
          ."" '<  `.___\_<|>_/___.' >' "".
         | | :  `- \`.;`\ _ /`;.`/ - ` : | |
         \  \ `_.   \_ __\ /__ _/   .-` /  /
     =====`-.____`.___ \_____/___.-`___.-'=====
                       `=---='

                 小學堂真的會超渡我= =

     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
```
