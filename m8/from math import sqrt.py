import unittest

from Solver import Solver

class TestSolver(unittest.TestCase):

    def real_quadratic_roots(a, b, c):
        
        s = Solver()
        discriminant = b**2 - 4.0*a*c
        if discriminant < 0.0:
            return None

        if a == 0:
            if b == 0:
                raise NotImplementedError("Cannot solve quadratic with both a"
                                      " and b coefficients equal to 0.")
            else:
                return -c / b

        x_plus = (-b + sqrt(discriminant)) / (2.0*a)
        x_minus = (-b - sqrt(discriminant)) / (2.0*a)

        return x_plus, x_minus
    
if __name__ == "__main__":
    unittest.main()