from math import sqrt
import unittest

class TestSolver(unittest.TestCase):

    def real_quadratic_roots(a, b, c):
        
        discriminant = b**2 - 4.0*a*c
        if discriminant < 0.0:
            return None

        if a == 0:
            if b == 0:
                raise NotImplementedError("Cannot solve quadratic with both a and b coefficients equal to 0.")
            else:
                return -c / b
 
        x_plus = (-b + sqrt(discriminant)) / (2.0*a)
        x_minus = (-b - sqrt(discriminant)) / (2.0*a)

        return x_plus, x_minus
    
    def test_no_roots(self):
    
        roots = None
        self.assertEqual(self.real_quadratic_roots(1, 0, 1), roots, err_msg="Testing x^2+1=0; no real roots.")

    def test_zero_roots(self):
    
        roots = (0, 0)
        self.assertEqual(self.real_quadratic_roots(1, 0, 0), roots, err_msg="Testing x^2=0; should both be zero.")

    def test_real_distinct(self):
    
        roots = (1.0, -1.0)
        self.assertEqual(self.real_quadratic_roots(1, 0, -1), roots, err_msg="Testing x^2-1=0; roots should be 1 and -1.")

    def test_real_distinct_irrational(self):
        roots = (1 + 1e-5, 1 - 1e-5)
        self.assertAllClose(self.real_quadratic_roots(1, -2.0, 1.0 - 1e-10), roots, err_msg="Testing x^2-2x+(1-1e-10)=0; roots should be 1 +- 1e-5.")

    def test_real_linear_degeneracy(self):
    
        root = -1.0
        self.assertEqual(self.real_quadratic_roots(0, 1, 1), root, err_msg="Testing x+1=0; root should be -1.")
    test_no_roots()
    test_zero_roots()
    test_real_distinct()
    test_real_distinct_irrational()
    test_real_linear_degeneracy()
        
if __name__ == "__main__":
    unittest.main()
    