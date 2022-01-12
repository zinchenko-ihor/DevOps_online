import unittest
import solv_square_equation

class TestSolver(unittest.TestCase):

    def test_discriminant_0(self):
        self.assertEqual(solv_square_equation.discriminant(2, 3, 5), -31)
    
    def test_solv_square_0(self):
        self.assertEqual(solv_square_equation.solv_square(2, 3, 5), (None))

    def test_roots_0(self):
        self.assertEqual(solv_square_equation.roots(-31, 2, 3, 5), (None))
    
    def test_discriminant_1(self):
        self.assertEqual(solv_square_equation.discriminant(16, -8, 1), 0)
    
    def test_solv_square_1(self):
        self.assertEqual(solv_square_equation.solv_square(16, -8, 1), 0.25)

    def test_roots_1(self):
        self.assertEqual(solv_square_equation.roots(0, 16, -8, 1), 0.25)

    def test_discriminant_2(self):
        self.assertEqual(solv_square_equation.discriminant(-4, -1, 10), 161)
    
    def test_solv_square_2(self):
        self.assertEqual( solv_square_equation.solv_square(-4, -1, 10), (-1.71107219255619, 1.46107219255619))

    def test_roots_2(self):
        self.assertEqual( solv_square_equation.roots(161, -4, -1, 10), (-1.71107219255619, 1.46107219255619))

    
    
if __name__ == "__main__":
    unittest.main()