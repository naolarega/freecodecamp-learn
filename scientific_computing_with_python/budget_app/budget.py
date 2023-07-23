from math import ceil
from typing import List


class Category:
    def __init__(self, category: str):
        self.category = category
        self.ledger = []
    
    def deposit(
        self,
        amount: float,
        description: str=""
    ):
        self.ledger.append({
            "amount": amount,
            "description": description
        })

    def withdraw(
        self,
        amount: float,
        description: str=""
    ) -> bool:
        if not self.check_funds(amount):
            return False
        
        self.ledger.append({
            "amount": -amount,
            "description": description
        })

        return True

    def get_balance(self) -> float:
        balance = 0
        
        for txn in self.ledger:
            balance = balance + txn["amount"]
        
        return balance

    def transfer(
        self,
        amount: float,
        budget_category
    ) -> bool:
        if not self.check_funds(amount):
            return False

        self.withdraw(
            amount=amount,
            description=f"Transfer to {budget_category.category}"
        )

        budget_category.deposit(
            amount=amount,
            description=f"Transfer from {self.category}"
        )

        return True
    
    def check_funds(self, amount: float) -> bool:
        return amount <= self.get_balance()
    
    def __str__(self) -> str:
        title_stars = (30 - len(self.category)) / 2
        category_str = f"{'*' * int(title_stars)}{self.category}{'*' * ceil(title_stars)}\n"

        total = 0

        for txn in self.ledger:
            if len(txn["description"]) > 23:
                category_str += txn["description"][:23]
            else:
                category_str += f"{txn['description']}{' ' * (23 - len(txn['description']))}"
            
            total += txn["amount"]
            
            amount_str = str(round(float(txn["amount"]), 2))

            if len(amount_str.split(".")[1]) < 2:
                amount_str += "0"

            if len(amount_str) > 7:
                category_str += amount_str
            else:
                category_str += f"{' ' * (7 - len(amount_str))}{amount_str}"
            category_str += "\n"
        
        total_str = str(round(float(total), 2))

        if len(total_str.split(".")[1]) < 2:
            total_str += "0"

        category_str += f"Total: {total_str}"
        
        return category_str


def create_spend_chart(categories: List[Category]):
    spent_chart = "Percentage spent by category\n"
    spent_in_category = []
    spent_perc = []
    chart_footer_max_len = 0
    withdraws = 0

    for category in categories:
        withdraw = 0

        for txn in category.ledger:
            if txn["amount"] < 0:
                withdraws += abs(txn["amount"])
                withdraw += abs(txn["amount"])
        
        spent_in_category.append((
            withdraw,
            category.category
        ))

        if len(category.category) > chart_footer_max_len:
            chart_footer_max_len = len(category.category)
    
    for idx, (withdraw, category) in enumerate(spent_in_category):
        spent_perc.append((
            (withdraw * 100) / withdraws,
            category
        ))
    
    for perc in reversed(range(0, 110, 10)):
        perc_str = ""
    
        if perc == 0:
            perc_str += "  0|"
        elif perc < 100:
            perc_str += f" {perc}|"
        else:
            perc_str += "100|"
        
        for spent in spent_perc:
            if spent[0] >= perc:
                perc_str += " o "
            else:
                perc_str += "   "
        
        spent_chart += f"{perc_str} \n"


    spent_chart += f"    {'---' * len(spent_perc)}-\n"
    
    for idx in range(0, chart_footer_max_len):
        spent_chart += "    "
        
        for _, category in spent_perc:
            if idx < len(category):
                spent_chart += f" {category[idx]} "
            else:
                spent_chart += "   "
        
        spent_chart += " "

        if idx < chart_footer_max_len - 1:
            spent_chart += "\n"
    
    return spent_chart