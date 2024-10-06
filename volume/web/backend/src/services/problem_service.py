import random, json
from sqlalchemy.orm import Session
from typing import List
from ..crud import ProblemDAO
from ..utils.pdf_generator import PDFGenerator 
from ..utils.problem_command import ProblemCommand
from ..models import Problem
from ..schemas import ProblemRequest, ChapterGradeRequest
from . import recommendation_service 

class ProblemService:
    def __init__(self):
        self.problem_dao = ProblemDAO() 
        self.recommendation_service = recommendation_service.RecommendationService()

    def generate_problems_pdf(self, request: ProblemRequest, db: Session) -> str:
        # 針對填充題進行選題
        fill_in_problems = self.find_and_select_problems(
            db,
            version=request.version,
            grade=request.grade,
            chapters=request.chapter,
            difficulties=request.difficulty,
            num_problems=request.fill_in_blanks_count,
            pmode=1  # 1 代表填充題
        )
        
        # 針對選擇題進行選題
        multiple_choice_problems = self.find_and_select_problems(
            db,
            version=request.version,
            grade=request.grade,
            chapters=request.chapter,
            difficulties=request.difficulty,
            num_problems=request.multiple_choice_count,
            pmode=2  # 2 代表選擇題
        )

        pdf_generator = PDFGenerator(request, fill_in_problems, multiple_choice_problems)
        pdf_path = pdf_generator.generate_pdf()
        return pdf_path

    def find_and_select_problems(self, db: Session, version: int, grade: int, chapters: List[int], difficulties: List[int], num_problems: int, pmode: int):
        # 生成問題列表
        problem_commands = self._generate_problem_list(
            db, version, grade, chapters, difficulties, num_problems, pmode
        )

        # 動態增加 total 確保題目數量充足
        self._adjust_total_for_missing_problems(problem_commands, num_problems)

        return problem_commands


    def _generate_problem_list(self, db: Session, version: int, grade: int, chapters: List[int], difficulties: List[int], num_problems: int, pmode: int) -> List[ProblemCommand]:
        chapters_id_list = []
        problem_commands = []

        total_combinations = len(chapters) * len(difficulties)
        problems_per_combination = num_problems // total_combinations

        # 獲取所有章節的 ID
        for chapter in chapters:
            chapter_id = self.problem_dao.find_chapter_id(db, version, grade, chapter)
            if chapter_id is not None:
                chapters_id_list.append(chapter_id)

        if not chapters_id_list:
            raise ValueError("No valid chapter IDs found")

        # 生成問題列表，並在不足時立即循環增加 total
        for chapter_id in chapters_id_list:
            for difficulty in difficulties:
                # 查詢該章節和難度下的問題
                results = self.problem_dao.find_problems_by_chapter_and_difficulty(
                    db, chapter_id, difficulty, problems_per_combination
                )

                # 如果結果數量不足，則在現有題目上循環增加 total
                if len(results) < problems_per_combination:
                    for problem in results:
                        # 將 problem.parameter 轉換為字典
                        try:
                            parameter_dict = json.loads(problem.parameter)
                        except json.JSONDecodeError:
                            raise ValueError(f"Invalid JSON in problem parameter: {problem.parameter}")

                        kind = parameter_dict.get('kind', 'default')
                        problem_commands.append(ProblemCommand(kind=kind, total=1, pmode=pmode, program_name=problem.program.program_name))

                    # 循環增加 total，直到達到期望的數量
                    index = 0
                    while len(results) + index < problems_per_combination:
                        problem_commands[index % len(problem_commands)].total += 1
                        index += 1
                else:
                    # 正常處理
                    for problem in results:
                        try:
                            parameter_dict = json.loads(problem.parameter)
                        except json.JSONDecodeError:
                            raise ValueError(f"Invalid JSON in problem parameter: {problem.parameter}")

                        kind = parameter_dict.get('kind', 'default')
                        problem_commands.append(ProblemCommand(kind=kind, total=1, pmode=pmode, program_name=problem.program.program_name))

        return problem_commands

    def _adjust_total_for_missing_problems(self, problem_commands: List[ProblemCommand], required_total: int):
        # 計算當前問題的總題數
        current_total = sum(command.total for command in problem_commands)
        missing_count = required_total - current_total

        # 如果總數不足，逐步增加每個 command 的 total
        index = 0
        while missing_count > 0:
            problem_commands[index].total += 1
            missing_count -= 1
            index = (index + 1) % len(problem_commands)  # 循環增加每個 command 的 total


    async def get_problem_with_recommandation(self, request: ProblemRequest, db: Session):
        recommandation_problems = await self.recommendation_service.get_recommendations(request)
        return recommandation_problems
        

