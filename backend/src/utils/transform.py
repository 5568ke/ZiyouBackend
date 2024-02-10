from sqlalchemy.orm import Session
from sqlalchemy import Integer
from sqlalchemy.sql.expression import cast
from typing import Tuple, List

import json
import csv
import re

from .. import models,schemas
from ..crud import create_program, create_problem, create_theme, create_keyword, create_chapter, create_edition, create_edition_chapter, get_theme_by_name,create_keyword 
from ..schemas import ProgramCreate, ProblemCreate, Theme, Keyword, ChapterCreate, EditionCreate, EditionChapterCreate,ProblemCreate,ProgramCreate,KeywordCreate

## 癌症癌症癌症癌症癌症
## 這個 python script 用來把資料從舊的 db 轉換到新的 db 中

def transform_quiz(db: Session):

    ## ziyou chapter dict
    with open("/usr/backend/datafiles/ziyou_chapter_list.txt", 'r', encoding='utf-8') as file:
        raw_data = file.read()
    ziyou_chapter_list = eval(raw_data)
    ziyou_chapter_dict = {}
    for item in ziyou_chapter_list:
        ziyou_chapter_dict[item[0]] = {"edition_id":item[1],"grade":item[2],"chapter_number":item[3],"chapter_name":item[4]}

    # 開啟SQL檔案
    with open("/usr/backend/datafiles/quizbase_2024.sql", 'r', encoding='utf-8') as file:
        # 讀取檔案內容
        sql_content = file.read()

    # 使用正規表達式找出INSERT INTO語句
    insert_patterns = re.findall(r'INSERT INTO `quizbase` VALUES \((.*?)\);', sql_content, re.DOTALL)

    # 遍歷每一筆INSERT INTO語句
    for insert_statement in insert_patterns:
        quiz_list = insert_statement.split('),(')

        for i,quiz_str in enumerate(quiz_list):
            # 將單個記錄字符串轉換為列表
            quiz_str = quiz_str.replace('NULL', 'None')
            quiz_data = eval(f"({quiz_str})")
            
            # 轉換和創建Program
            program_create = schemas.ProgramCreate(
                nasd=quiz_data[0],  # nsad
                topic=quiz_data[5],  # topic
                description=quiz_data[7],  # description
                program_name=quiz_data[8],  # code_num
            )
            program = create_program(db, program_create)

            # 轉換和創建Problem
            problem_create = schemas.ProblemCreate(
                program_id=program.id,
                chapter_id=determine_chapter_id(db,ziyou_chapter_dict,quiz_data),
                difficulty=int(quiz_data[12]),  
                parameter=determine_parameter(quiz_data),
                nsrd_id=None
            )
            print(problem_create)
            problem = create_problem(db, problem_create)

            themes_str = quiz_data[13]  
            themes_list = themes_str.split('/')
            print("id : ",quiz_data[1])
            for theme_name in themes_list[:-1]:
                theme = get_theme_by_name(db,theme_name)
                problem.themes.append(theme)

            keywords_list = quiz_data[6].split(' ')
            for keyword_text in keywords_list:
                create_keyword(db,KeywordCreate(keyword=keyword_text,problem_id=problem.id))


def determine_chapter_id(db: Session, ziyou_chapter_dict, quiz_data):
    chapter_key = quiz_data[2].split('/')[0]
    chapter_info = ziyou_chapter_dict.get(chapter_key, None)
    chapter_name = chapter_info["chapter_name"]
    chapter = db.query(models.Chapter).filter(models.Chapter.name == chapter_name).first()
    
    if chapter:
        return chapter.id
    else:
        return -1

def determine_parameter(quiz_data):
    program_name = quiz_data[8]
    kind_value = quiz_data[9]
    parameter = {}

    file_path = "/usr/backend/datafiles/datfile/" + program_name + ".dat" 
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            lines = file.readlines()
            param_names_line = None
            for i, line in enumerate(lines):
                if re.match(r'#\s*kind', line.strip()):    #有人就是要故意給我兩格空三格空n格，真的沒有關係，我一定請你吃超派鐵拳
                    param_names_line = lines[i]  
                elif line.strip().startswith(str(kind_value)):
                    param_values = line.strip().split()
                    param_names = param_names_line.strip().split()
                    for j, name in enumerate(param_names[1:], start=0):
                        if j < len(param_values):  
                            parameter[name] = param_values[j]
                    break
    except FileNotFoundError:
        print(f"File {file_path} not found.")
    return json.dumps(parameter)  



def transform_edition_chapter_data(db: Session) -> None:

    with open("/usr/backend/datafiles/ziyou_chapter_list.txt", 'r', encoding='utf-8') as file:
        raw_data = file.read()
    ziyou_chapter_list = eval(raw_data)

    with open("/usr/backend/datafiles/other_edition_chapter_list.txt", 'r', encoding='utf-8') as file:
        raw_data = file.read()
    other_edition_chapter_list = eval(raw_data)

    with open("/usr/backend/datafiles/edition_comparison.txt",'r',encoding='utf-8') as file:
        raw_data=file.read()
    edition_comparison_list=eval(raw_data)

    other_edition_chapter_dict = {}
    for item in other_edition_chapter_list:
        other_edition_chapter_dict[item[0]] = {"edition_id":item[1],"grade":item[2],"chapter_number":item[3],"chapter_name":item[4]}
    print(other_edition_chapter_dict)

    ziyou_chapter_dict = {}
    for item in ziyou_chapter_list:
        ziyou_chapter_dict[item[0]] = {"edition_id":item[1],"grade":item[2],"chapter_number":item[3],"chapter_name":item[4]}
    print(ziyou_chapter_dict)


    for item in edition_comparison_list:
        print(item)
        other_version_chapters = item[1].split('/')

        chapter_model=create_chapter(db,schemas.ChapterCreate(name=ziyou_chapter_dict[item[0]]["chapter_name"]))
        ziyou_chapter_id=chapter_model.id

        for other_version_chapter in other_version_chapters:
            if other_version_chapter == "":
                continue
            create_edition_chapter(db,schemas.EditionChapterCreate(
                chapter_id=ziyou_chapter_id,
                edition_id=other_edition_chapter_dict[other_version_chapter]["edition_id"],
                grade_number=other_edition_chapter_dict[other_version_chapter]["grade"],
                chapter_number=other_edition_chapter_dict[other_version_chapter]["chapter_number"],
                chapter_name=other_edition_chapter_dict[other_version_chapter]["chapter_name"]
            ))
            

def transform_theme(db: Session) -> None:
    theme_list = [
        "加法", "減法", "加減法", "乘法", "除法", "乘除法", "四則運算", 
        "數數看", "大數", "概數", "小數", "分數", "因數與倍數", 
        "比率、比值、百分率", "兩步驟計算", "怎樣解題", "分配律、交換律、結合律", 
        "等量公理", "時間", "長度", "角度", "重量", "容量", "錢幣", 
        "速率", "周長", "面積", "表面積", "體積", "幾何圖形、立體形體", 
        "統計圖表", "生活中的大單位", "未知數", "縮圖、放大圖與比例尺", 
        "單位換算", "分數與小數"
    ]

    for theme_entry in theme_list:
        theme = Theme(theme=theme_entry)
        create_theme(db, theme)

# generate_theme_data(db)

def transform_keyword(db: Session) -> None:
    with open("/usr/backend/datafiles/keyword_list.txt", 'r', encoding='utf-8') as file:
        raw_data = file.read()
    keyword
    _list = eval(raw_data)
    for item in _list:
        keyword = Keyword(keyword=item[0],problem_id=item[1])
        create_keyword(db, keyword)
        

