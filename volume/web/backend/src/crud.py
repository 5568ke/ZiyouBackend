from sqlalchemy.orm import Session
from typing import List
from . import models, schemas

# Create
def create_program(db: Session, program: schemas.ProgramCreate):
    db_program = models.Program(**program.model_dump())
    db.add(db_program)
    db.commit()
    db.refresh(db_program)
    return db_program

def create_problem(db: Session, problem: schemas.ProblemCreate):
    db_problem = models.Problem(**problem.model_dump())
    db.add(db_problem)
    db.commit()
    db.refresh(db_problem)
    return db_problem

def create_theme(db: Session, theme: schemas.Theme):
    db_theme = models.Theme(**theme.model_dump())
    db.add(db_theme)
    db.commit()
    db.refresh(db_theme)
    return db_theme

def get_theme_by_id(db: Session, theme_id: int):
    return db.query(models.Theme).filter(models.Theme.id == theme_id).first()

def get_theme_by_name(db: Session, theme_content: str):
    return db.query(models.Theme).filter(models.Theme.theme == theme_content).first()

def create_keyword(db: Session, keyword: schemas.Keyword):
    db_keyword = models.Keyword(**keyword.model_dump())
    db.add(db_keyword)
    db.commit()
    db.refresh(db_keyword)
    return db_keyword

def create_chapter(db: Session, chapter: schemas.ChapterCreate):
    db_chapter = models.Chapter(**chapter.model_dump())
    db.add(db_chapter)
    db.commit()
    db.refresh(db_chapter)
    return db_chapter

def create_edition(db: Session, edition: schemas.EditionCreate):
    db_edition = models.Edition(**edition.model_dump())
    db.add(db_edition)
    db.commit()
    db.refresh(db_edition)
    return db_edition

def create_edition_chapter(db: Session, edition_chapter: schemas.EditionChapterCreate):
    db_edition_chapter = models.EditionChapter(**edition_chapter.model_dump())
    db.add(db_edition_chapter)
    db.commit()
    db.refresh(db_edition_chapter)
    return db_edition_chapter

def create_nsrd(db: Session, nsrd_create: schemas.NSRDCreate):
    db_nsrd = models.NSRD(category=nsrd_create.category)
    db.add(db_nsrd)
    db.commit()
    db.refresh(db_nsrd)
    return db_nsrd

def get_nsrd(db: Session, nsrd_id: int):
    return db.query(models.NSRD).filter(models.NSRD.id == nsrd_id).first()

def get_keyword_by_text(db: Session, keyword_text: str):
    return db.query(models.Keyword).filter(models.Keyword.keyword == keyword_text).first()



class ProblemDAO:
    def find_chapter_id(self, db: Session, version: int, grade: int, chapter: int):
        return db.query(models.EditionChapter.chapter_id).filter(
            models.EditionChapter.edition_id == version,
            models.EditionChapter.grade_number == grade,
            models.EditionChapter.chapter_number == chapter
        ).first().chapter_id

    def find_problems_by_chapter_and_difficulty(self, db: Session, chapter_id: int, difficulty: int, num_problems: int) -> List[models.Problem]:
        return db.query(models.Problem).filter(
            models.Problem.chapter_id == chapter_id,
            models.Problem.difficulty == difficulty
        ).limit(num_problems).all()
