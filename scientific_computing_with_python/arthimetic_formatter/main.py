import re


def arithmetic_arranger(problems, include_answer=False):
  if len(problems) > 5:
    return "Error: Too many problems."
  
  operands_operators = []

  for problem in problems:
    operands = re.findall("^\\d+(?=\\s)|(?<=\\s)\\d+$", problem)
    operator = re.findall("\\+|\\-", problem)

    if len(operator) > 1 or len(operator) < 1:
      return "Error: Operator must be '+' or '-'."
    
    if len(operands) > 2 or len(operands) < 2:
      return "Error: Numbers must only contain digits."
    
    for operand in operands:
      if len(operand) > 4:
        return "Error: Numbers cannot be more than four digits."
    
    operands_operators.append(
      (*operands, operator[0])
    )
  
  arranged_problems = ""
  
  # operand one
  for idx, (operand_one, operand_two, _) in enumerate(operands_operators):
    if len(operand_one) > len(operand_two):
      arranged_problems += f"{'  '}{operand_one}"
    else:
      arranged_problems += f"{' ' * (2 + len(operand_two) - len(operand_one))}{operand_one}"
    if idx < len(operands_operators) - 1:
      arranged_problems += " " * 4
    else:
      arranged_problems += "\n"
  
  # operand two and operator
  for idx, (operand_one, operand_two, operator) in enumerate(operands_operators):
    if len(operand_two) > len(operand_one):
      arranged_problems += f"{operator}{' '}{operand_two}"
    else:
      arranged_problems += f"{operator}{' ' * (1 + len(operand_one) - len(operand_two))}{operand_two}"
    if idx < len(operands_operators) - 1:
      arranged_problems += " " * 4
    else:
      arranged_problems += "\n"
  
  # dashs
  for idx, (operand_one, operand_two, _) in enumerate(operands_operators):
    arranged_problems += f"{'-' * (2 + max(len(operand_one), len(operand_two)))}"
    if idx < len(operands_operators) - 1:
      arranged_problems += " " * 4

  if include_answer:
    arranged_problems += "\n"
    for idx, (operand_one, operand_two, operator) in enumerate(operands_operators):
      result = str(eval(f"{operand_one}{operator}{operand_two}"))
      max_operand = max(len(operand_one), len(operand_two)) + 2
      arranged_problems += f"{' ' * (len(result) - max_operand if len(result) > max_operand else max_operand - len(result))}{result}"
      if idx < len(operands_operators) - 1:
        arranged_problems += " " * 4
  
  return arranged_problems