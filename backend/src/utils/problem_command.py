# utils/problem_command.py

from typing import Optional

class ProblemCommand:
    def __init__(self, program_name: str, db_parameters: str, oform: str, color: str):
        self.program_name = program_name
        self.db_parameters = db_parameters  # parameter from the database
        self.oform = oform
        self.color = color

    def get_command_line(self, latex_file_path: str) -> str:
        command_line = f"{self.program_name}, -db_parameters={self.db_parameters}, -ofrom={self.oform}, -color={self.color} >> {latex_file_path}"
        return command_line

    def __str__(self):
        return f"{self.program_name}, -db_parameters={self.db_parameters}, -oform={self.oform}, -color={self.color}"


