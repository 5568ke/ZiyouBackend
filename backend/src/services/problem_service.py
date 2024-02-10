import random
from sqlalchemy.orm import Session
from typing import List
from ..crud import ProblemDAO
from ..utils.pdf_generator import PDFGenerator 
from ..models import Problem

class ProblemService:
    def __init__(self, problem_dao: ProblemDAO):
        self.problem_dao = problem_dao

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

    def generate_pdf(self, selected_problems: List[Problem]) -> PDFGenerator :
        commands = [(problem.program.program_name, problem.parameter) for problem in selected_problems]
        pdf_generator = PDFGenerator(commands)
        pdf_generator.execute()
        return pdf_generator
