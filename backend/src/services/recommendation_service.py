import sys

from src.schemas import ProblemRequest
sys.path.append('/usr/backend/proto_python_file')

import grpc
import recommendation_pb2
import recommendation_pb2_grpc
from typing import List

class RecommendationService:
    def __init__(self):
        self.grpc_server_address = 'recommendation:50051' 

    async def get_recommendations(self, request: ProblemRequest) -> List[int]:
        # Note: Use grpc.aio.insecure_channel for asynchronous operations
        async with grpc.aio.insecure_channel(self.grpc_server_address) as channel:
            stub = recommendation_pb2_grpc.RecommendationStub(channel)
            grpc_request = recommendation_pb2.RecommendationRequest(
                version=request.version,
                grade=request.grade,
                chapters=request.chapter,
                difficulties=request.difficulty,
                numProblems=request.fill_in_blanks_count
            )
            # Await the asynchronous call to GetRecommendation
            response = await stub.GetRecommendation(grpc_request)
            print(response.problemIds)
        return response.problemIds

