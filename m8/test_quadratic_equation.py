import unittest

from Solver import Solver

class TestSolver(unittest.TestCase):

    def test_negative_discr(self):

        s = Solver()
        self.assertRaises(Exception)

    
    def test_something(self):
        
        self.assertEqual( True, False )
    
if __name__ == "__main__":
    unittest.main()





#def roots(a,b,c):
    
      #  discr = b**2 - 4*a*c
      #  if discr == 0:
       #     x = (-b) / (2.0 * a)
       #     return (x,)
       # if discr < 0:
       #     return ()
       # if discr > 0:
       #     x1 = (-b + discr**0.5) / (2.0 * a)
       #     x2 = (-b - discr**0.5) / (2.0 * a)
       #     return (x1, x2)