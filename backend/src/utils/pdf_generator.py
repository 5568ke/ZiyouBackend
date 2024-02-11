import subprocess
import uuid
import os
from datetime import datetime
from typing import List,Tuple
from .problem_command import ProblemCommand
from ..schemas import ProblemRequest
from ..models import Problem

class PDFGenerator:
    def __init__(self,request: ProblemRequest, selected_problems: List[Problem]):
        self.commands = [
            ProblemCommand(
                problem.program.program_name,
                problem.parameter,
                request.oform,
                request.color
            )
            for problem in selected_problems
        ]

        timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
        unique_id = uuid.uuid4().hex[:8]
        self.latex_filename = f"{timestamp}_{unique_id}.tex"
        self.latex_file_path = f"pdf/{self.latex_filename}"
        self.request = request

    def execute(self):
        with open(self.latex_file_path, 'w') as latex_file:
            for command in self.commands:
                cmd_line = command.get_command_line(self.latex_file_path)
                print("Executing command: ", cmd_line)
                subprocess.run(cmd_line, shell=True, check=True, stdout=latex_file, stderr=subprocess.PIPE)
        
        # self.compile_pdf()  
        return self.latex_file_path.replace('.tex', '.pdf')

    def compile_pdf(self):
        #還在看怎麼把舊的用 perl script 做的編譯拔掉，現在沒辦法實做。
        #要先放一些request的參數到latex file的header
        pass

    def __str__(self):
        commands_str = " ".join(str(command) for command in self.commands)
        return f"PDFGenerator(commands=[{commands_str}])"

