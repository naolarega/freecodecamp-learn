class Rectangle:
    def __init__(
        self,
        width: int,
        height: int
    ):
        self.width = width
        self.height = height
    
    def set_width(self, width: int):
        self.width = width
    
    def set_height(self, height: int):
        self.height = height
    
    def get_area(self) -> int:
        return self.width * self.height
    
    def get_perimeter(self) -> int:
        return (2 * self.width) + (2 * self.height)
    
    def get_diagonal(self) -> int:
        return ((self.width ** 2) + (self.height ** 2)) ** 0.5
    
    def get_picture(self) -> str:
        if (
            self.width > 50 or
            self.height > 50
        ):
            return "Too big for picture."
    
        picture = ""
        
        for _ in range(0, self.height):
            picture += f"{'*' * self.width}\n"
        
        return picture
    
    def get_amount_inside(self, shape) -> int:
        return (self.width * self.height) // (shape.width * shape.height)
    
    def __str__(self):
        return f"Rectangle(width={self.width}, height={self.height})"


class Square(Rectangle):
    def __init__(self, side: int):
        self.width = self.height = side

    def set_side(self, side: int):
        self.width = self.height = side
    
    def set_width(self, width: int):
        self.set_side(width)

    def set_height(self, height: int):
        self.set_side(height)
    
    def __str__(self):
        return f"Square(side={self.width})"