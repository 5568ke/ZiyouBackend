import subprocess
from typing import List,Tuple

class PDFGenerator:
    def __init__(self, commands: List[Tuple[str, str]] =None):
        self.commands = commands if commands is not None else []

    def execute(self):
        for program_name, parameter in self.commands:
            command = f"{program_name} {parameter}"
            try:
                result = subprocess.run(command, shell=True, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
                print(f"Command executed successfully: {result.stdout.decode('utf-8')}")
            except subprocess.CalledProcessError as e:
                print(f"Error executing command: {e.stderr.decode('utf-8')}")

    def __str__(self):
        return f"PDFGenerator(commands={self.commands})"
