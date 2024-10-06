# utils/problem_command.py

class ProblemCommand:
    def __init__(self, kind: str, total: int, pmode: str, program_name: str):
        """
        :param kind: 題目的種類
        :param total: 總生成的題目數量
        :param pmode: 題目類型 (填充題或單選題)
        :param program_name: 程序名稱
        """
        self.kind = kind
        self.total = total
        self.pmode = pmode
        self.program_name = program_name

    def get_command_line(self, latex_file_path: str) -> str:
        """
        根據 kind、total、pmode 和 program_name 生成命令行，符合格式：
        ./program_name -kind X -total Y -pmode Z -oform a4 >> latex_file_path
        :param latex_file_path: 用於輸出的 latex 文件路徑
        :return: 完整的命令行字符串
        """
        command_line = f"./{self.program_name} -kind {self.kind} -total {self.total} -pmode {self.pmode} -oform a4"
        return command_line

    def __str__(self):
        return f"./{self.program_name} -kind {self.kind} -total {self.total} -pmode {self.pmode} -oform a4"
