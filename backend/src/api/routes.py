import fastapi
from fastapi import Depends, HTTPException
from sqlalchemy.orm import Session
from ..utils.transform import  transform_edition_chapter_data, transform_theme, transform_quiz
from ..schemas import ProblemRequest
from ..crud import ProblemDAO
from ..services.problem_service import ProblemService  
from ..db.session import get_db

router = fastapi.APIRouter()

# test
@router.get("/")
async def root():
    return {"message": "test"}

# transfroming data from old sql database, dat file and txt file
@router.get("/build-chapter-edition/")
def build_edition_chapter(db: Session = Depends(get_db)):
    return transform_edition_chapter_data(db) 

# transfroming data from old sql database, dat file and txt file
@router.get("/build-theme/")
def build_theme(db: Session = Depends(get_db)):
    return transform_theme(db)

# transfroming data from old sql database, dat file and txt file
@router.get("/build-problem-program/")
def build_problem_program(db: Session = Depends(get_db)):
    return transform_quiz(db)

# generate pdf 
@router.post("/get-pdf/")
def get_pdf(request: ProblemRequest, db: Session = Depends(get_db)):  
    problem_dao = ProblemDAO()
    problem_service = ProblemService(problem_dao=problem_dao)
    try:
        problems = problem_service.find_and_select_problems(db, request.version, request.grade, request.chapter, request.difficulty, request.fill_in_blanks_count)
        pdf_generator = problem_service.generate_pdf(request, problems)
        return [
            {str(pdf_generator)},
            {"problems" : problems}
        ]
    except ValueError as e:
        raise HTTPException(status_code=404, detail=str(e))

@router.post("/get-pdf-with-recommandation/")
def get_pdf_with_recommandation(request: ProblemRequest, db: Session = Depends(get_db)):  
    problem_dao = ProblemDAO()
    problem_service = ProblemService(problem_dao=problem_dao)
    try:
        problems = problem_service.get_problem_with_recommandation(request,db)
        # pdf_generator = problem_service.generate_pdf(request, problems)
        # return [
        #     {str(pdf_generator)},
        #     {"problems" : problems}
        # ]
        return "test"
    except ValueError as e:
        raise HTTPException(status_code=404, detail=str(e))

