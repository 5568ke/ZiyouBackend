import subprocess
import uuid
import os
import re
import requests
from datetime import datetime
from typing import List
from .problem_command import ProblemCommand
from ..schemas import ProblemRequest

class PDFGenerator:
    def __init__(self, request: ProblemRequest, fill_in_commands: List[ProblemCommand], multiple_choice_commands: List[ProblemCommand]):
        self.request = request  
        self.fill_in_commands = fill_in_commands  # 填充題列表
        self.multiple_choice_commands = multiple_choice_commands  # 單選題列表

        timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
        unique_id = uuid.uuid4().hex[:8]
        self.tex_filename = f"{timestamp}_{unique_id}.tex"

        self.tex_file_dir = "/usr/backend/tex"
        self.tex_file_path = os.path.join(self.tex_file_dir, self.tex_filename)

        self.tex_util_dir = '/usr/backend/tex_util_files'
        self.build_dir = "/usr/backend/emath_binary/emath_cmake_project/build/emath"
        self.pdf_file_dir = "/usr/backend/pdf"

    def produce_tex_file(self):
        # 確保 TeX 文件目錄存在
        os.makedirs(self.tex_file_dir, exist_ok=True)
        
        print(f"Creating TeX file at: {self.tex_file_path}")
        
        with open(self.tex_file_path, 'w') as tex_file:            
            # 1. latex preamble (寫入文檔類型)
            self._append_to_texfile("latex_documentclass", tex_file)

            # 2. latex paper size
            self._set_paper_size(tex_file)

            # 3. latex commands
            self._append_to_texfile("latex_commands", tex_file)

            # 4. 處理標題
            fsize = self.get_fsize(self.request.oform, self.request.fsize)
            title = self.adjust_latexchars(self.request.title)

            # 5. header/footer
            self._append_to_texfile("latex_header_footer", tex_file)

            # 6. begin document
            self._append_to_texfile("latex_begin_document", tex_file)



            # 7. 處理單選題列表
            tex_file.write("\\large\\textbf{單選題：}\n")
            tex_file.write("\\begin{wlist}{xxxxxxxxx}\itemsep 1ex")
            self._write_problem_list(self.multiple_choice_commands, tex_file)
            tex_file.write("\\end{wlist}\n")

            # 8. 處理填充題列表
            tex_file.write("\\large\\textbf{填充題：}\n")
            tex_file.write("\\begin{wlist}{xxxxxxxxx}\itemsep 1ex")
            self._write_problem_list(self.fill_in_commands, tex_file)
            tex_file.write("\\end{wlist}\n")

            # 9. 結束文件
            self._append_to_texfile("latex_end_document", tex_file)

        print(f"TeX file successfully created at: {self.tex_file_path}")
        return self.tex_file_path

    def _write_problem_list(self, commands: List[ProblemCommand], tex_file):
        """處理問題列表並寫入到 tex 文件中"""
        item_count = 1
        for command in commands:
            tex_file.write(f"\\item[\\bf{{{item_count} (\hspace{{1.5em}})}}] ")
            self._execute_command(command, tex_file)
            item_count += 1

    def _execute_command(self, command, tex_file):
        """執行命令並將結果寫入 tex 文件"""
        cmd_line = command.get_command_line(self.tex_file_path)
        print("Executing command: ", cmd_line)
        
        # 執行命令並將結果寫入 tex 文件
        result = subprocess.run(cmd_line, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, cwd=self.build_dir)
        
        if result.returncode != 0:
            print(f"Command failed: {cmd_line}\nError: {result.stderr}")
        else:
            # 移除多餘的 \item
            processed_output = re.sub(r'\\item', '', result.stdout)

            processed_output = re.sub(r'\\\\\[0\.1em\]', '', processed_output)
            
            # 將標準輸出加到 tex_file
            print("Command execution successful, appending to tex file.")
            tex_file.write(processed_output + "\n")
            
    # 這裡是模擬從 latex_util_dir 加入模板文件的方法
    def _append_to_texfile(self, filename, tex_file):
        file_path = os.path.join(self.tex_util_dir, filename)
        if os.path.exists(file_path):
            with open(file_path, 'r') as file:
                tex_file.write(file.read())
        else:
            print(f"Warning: {file_path} not found, skipping this section.")

    # 假設存在定義紙張大小的方法
    def _set_paper_size(self, tex_file):
        paper_size_command = "\\usepackage[a4paper]{geometry}\n"
        tex_file.write(paper_size_command)

    # 假設有獲取字型大小的功能
    def get_fsize(self, oform, fsize):
        return "\\normalsize"  # Example

    # 處理標題的特殊字符
    def adjust_latexchars(self, title):
        return title.replace("_", "\\_")  # 簡單處理

    # 處理 header/footer 的邏輯
    def _apply_header_footer(self, title, tex_file):
        header_template = "\\lhead{\\Large " + title + "}\n"
        tex_file.write(header_template)

    def get_fsize(self, oform, fsize):
        """根據 oform 和 fsize 設定字體大小"""
        # 根據 oForm 和字體大小設定
        return fsize

    def adjust_latexchars(self, text):
        """處理 LaTeX 特殊字符"""
        return text.replace("&", "\\&")

    def compile_tex_to_pdf(self):
        try:
            files = {'file': open(self.tex_file_path, 'rb')}
            response = requests.post("http://10.0.0.111:9030/upload-tex/",files=files)
            

            if response.status_code == 200:
                pdf_filename = f"{self.request.title}.pdf"
                pdf_path = os.path.join(self.pdf_file_dir, pdf_filename)

                with open(pdf_path,'wb') as f:
                    f.write(response.content)
                    return pdf_path
                return response.json()
            else:
                print(f"Error occurred : {response.status_code} - {response.text}")
                return None
        except Exception as e:
            print(f"Exception occurred: {str(e)}")
            return None

        return


    def generate_pdf(self):
        self.produce_tex_file()
        return self.compile_tex_to_pdf()

    def __str__(self):
        commands_str = " ".join(str(command) for command in self.commands)
        return f"PDFGenerator(commands=[{commands_str}])"
