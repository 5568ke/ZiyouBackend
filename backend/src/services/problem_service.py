import random
from sqlalchemy.orm import Session
from typing import List
from ..crud import ProblemDAO
from ..utils.pdf_generator import PDFGenerator 
from ..models import Problem
from ..schemas import ProblemRequest
from . import recommendation_service 

class ProblemService:
    def __init__(self, problem_dao: ProblemDAO):
        self.problem_dao = problem_dao
        self.recommendation_service = recommendation_service.RecommendationService()

    def find_and_select_problems(self, db: Session, version: int, grade: int, chapters: List[int], difficulties: List[int], num_problems: int):
        chapters_id_list = []
        problems = []
        for chapter in chapters:
            chapter_id = self.problem_dao.find_chapter_id(db, version, grade, chapter)
            if chapter_id is not None:
                chapters_id_list.append(chapter_id)            

        if not chapters_id_list:
            raise ValueError("No valid chapter IDs found")

        print("chapter : ",chapters_id_list)

        for chapter_id in chapters_id_list:
            for difficulty in difficulties:
                problems.extend(self.problem_dao.find_problems_by_chapter_and_difficulty(db,chapter_id,difficulty))
        
        if not problems:
            raise ValueError("No problems found for the specified criteria")

        selected_problems = random.sample(problems, min(len(problems), num_problems))
        return selected_problems 

    async def get_problem_with_recommandation(self, request: ProblemRequest, db: Session):
        recommandation_problems = await self.recommendation_service.get_recommendations(request)
        return recommandation_problems
        

    def generate_pdf(self, request: ProblemRequest, selected_problems: List[Problem]) -> PDFGenerator:
        pdf_generator = PDFGenerator(ProblemRequest,selected_problems)
        pdf_generator.execute()
        return pdf_generator
