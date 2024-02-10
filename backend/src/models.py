from sqlalchemy import Column, column, DateTime, ForeignKey, Integer, SmallInteger, String, Table
from sqlalchemy.orm import relationship
from .db.session import Base


# Define association tables
problem_theme_table = Table('problem_theme_table', Base.metadata,
    Column('id', Integer, primary_key=True, autoincrement=True),
    Column('problem_id', Integer, ForeignKey('problems_table.id')),
    Column('theme_id', Integer, ForeignKey('themes_table.id'))
)


class Program(Base):
    __tablename__ = 'program_table'
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    nasd = Column(String)
    topic = Column(String)
    description = Column(String)
    program_name = Column(String)

    problem = relationship('Problem', back_populates='program', uselist=False)


class Problem(Base):
    __tablename__ = 'problems_table'
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    program_id = Column(Integer, ForeignKey('program_table.id'))
    chapter_id = Column(Integer, ForeignKey('chapters.id'))
    difficulty = Column(Integer)
    parameter = Column(String)
    nsrd_id = Column(Integer, ForeignKey('nsrd_table.id'), nullable=True)

    program = relationship('Program', back_populates='problem')
    chapter = relationship('Chapter', back_populates='problems')
    keywords = relationship('Keyword', back_populates='problem')
    nsrd = relationship("NSRD",back_populates='problems')
    themes = relationship("Theme", secondary=problem_theme_table, back_populates="problems")

class NSRD(Base):
    __tablename__ = 'nsrd_table'
    id = Column(Integer, primary_key=True, index=True,autoincrement=True)
    category = Column(String, index=True)

    problems = relationship("Problem", back_populates="nsrd")

class Theme(Base):
    __tablename__ = 'themes_table'
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    theme = Column(String)

    problems = relationship('Problem', secondary=problem_theme_table, back_populates='themes')

class Keyword(Base):
    __tablename__ = 'keywords_table'
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    problem_id = Column(Integer,ForeignKey("problems_table.id"))
    keyword = Column(String)

    problem = relationship('Problem', back_populates='keywords')

class Chapter(Base):
    __tablename__ = 'chapters'
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    name = Column(String)

    problems = relationship('Problem', back_populates='chapter')

class Edition(Base):
    __tablename__ = 'editions'
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    name = Column(String)

class EditionChapter(Base):
    __tablename__ = 'edition_chapters'
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    chapter_id = Column(Integer, ForeignKey('chapters.id'))
    edition_id = Column(Integer, ForeignKey('editions.id'))
    grade_number = Column(Integer)
    chapter_number = Column(Integer)
    chapter_name = Column(String)

    chapter = relationship('Chapter', back_populates='editions')
    edition = relationship('Edition', back_populates='chapters')

# Add relationships to Program model
# Program.problems = relationship('Problem', back_populates='program')

# Add relationships to Chapter and Edition models
Chapter.editions = relationship('EditionChapter', back_populates='chapter')
Edition.chapters = relationship('EditionChapter', back_populates='edition')

NSRD.problems = relationship("Problem", back_populates="nsrd", order_by=Problem.id)
