from typing import List, Optional
from pydantic import BaseModel, Field


# NSRD Schema
class NSRDCreate(BaseModel):
    category: str

class NSRD(BaseModel):
    id: int
    category: str
    
    class Config:
        orm_mode = True

class ProgramBase(BaseModel):
    nasd: str
    topic: str
    description: str
    program_name: str

class Program(ProgramBase):
    class Config:
        orm_mode = True

class ProgramCreate(ProgramBase):
    pass

# Problem Schema
class ProblemBase(BaseModel):
    program_id: int
    chapter_id: int
    difficulty: int
    parameter: Optional[str] = None
    nsrd_id: Optional[int] = None

class ProblemCreate(ProblemBase):
    pass

class Problem(ProblemBase):
    id: int
    nsrd: Optional[NSRD] = None

    class Config:
        orm_mode = True

# Theme schemas
class ThemeBase(BaseModel):
    theme: str

class ThemeCreate(ThemeBase):
    pass

class Theme(ThemeBase):
    id: int

    class Config:
        orm_mode = True

# Keyword schemas
class KeywordBase(BaseModel):
    keyword: str
    problem_id : int

class KeywordCreate(KeywordBase):
    pass

class Keyword(KeywordBase):
    id: int

    class Config:
        orm_mode = True

class ChapterCreate(BaseModel):
    name: str

class Chapter(BaseModel):
    name: str

    class Config:
        orm_mode = True

class EditionCreate(BaseModel):
    name: str

class Edition(BaseModel):
    name: str

    class Config:
        orm_mode = True

class EditionChapterCreate(BaseModel):
    chapter_id: int
    edition_id: int
    grade_number: int
    chapter_number: int
    chapter_name: str 

class EditionChapter(BaseModel):
    chapter: Chapter
    edition: Edition
    grade_number: int
    chapter_number: int
    chapter_name: str 

    class Config:
        orm_mode = True


class ProblemRequest(BaseModel):
    title: str = Field(..., example="test title")
    version: int = Field(..., example=1)
    oform: str = Field(..., example="a4")
    score: str = Field(..., example="5:5")
    phonic: Optional[bool] = Field(None, example=True)
    rand: Optional[bool] = Field(None, example=True)
    mono: Optional[bool] = Field(None, example=True)
    fsize: str = Field(..., example="normalsize")
    color: str = Field(..., example="Black")
    difficulty: List[int] = Field(..., example=[1, 2])
    chapter: List[int] = Field(..., example=[1, 2])
    grade: int = Field(..., example=11)
    fill_in_blanks_count: Optional[int] = Field(None, example=10, alias="填充題題數")
    multiple_choice_count: Optional[int] = Field(None, example=5, alias="單選題題數")

    class Config:
        schema_extra = {
            "example": {
                "title": "Math Quiz",
                "version": 1,
                "oform": "a4",
                "score": "5:5",
                "phonic": True,
                "rand": True,
                "mono": False,
                "fsize": "normalsize",
                "color": "Black",
                "difficulty": [1, 2],
                "chapter": [1, 2],
                "grade": 11,
                "填充題題數": 10,
                "單選題題數": 5
            }
        }
        allow_population_by_field_name = True

class ChapterGradeRequest(BaseModel):
    grade: int
    chapters: List[int]
