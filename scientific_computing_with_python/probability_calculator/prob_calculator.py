import copy
import random
from typing import Dict, List
# Consider using the modules imported above.

class Hat:
    def __init__(self, **colored_balls: int):
        self.contents = []

        for color, balls in colored_balls.items():
            self.contents.extend([color] * balls)
    
    def draw(self, balls: int) -> List[str]:
        if balls > len(self.contents):
            return self.contents

        drawn_balls = []

        for _ in range(balls):
            random_idx = random.randrange(0, len(self.contents))
            drawn_balls.append(self.contents.pop(random_idx))
        
        return drawn_balls


def experiment(
    hat: Hat,
    expected_balls: Dict[str, int],
    num_balls_drawn: int,
    num_experiments: int
):
    desired_draws = 0

    for _ in range(num_experiments):
        experiment_hat = copy.deepcopy(hat)
        drawn_balls = experiment_hat.draw(num_balls_drawn)

        desired_draw = True

        for color, balls in expected_balls.items():
            if drawn_balls.count(color) < balls:
                desired_draw = False
                break
        
        if desired_draw:
            desired_draws += 1
    
    return desired_draws / num_experiments