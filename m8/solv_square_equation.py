from math import sqrt
#class Solver:
def main():
    print("Введите коэффициенты для уравнения")
    print("ax^2 + bx + c = 0:")
    a = float(input("a = "))
    b = float(input("b = "))
    c = float(input("c = "))

    def validate_param(a,b,c):
        while type(a) != int:
            try:
                a = int(a)
            except ValueError:
                print("An error has occurred!")
                a = float(input("a = "))
            
        while type(b) != int:
            try:
                b = int(b)
            except ValueError:
                print("An error has occurred!")
                b = float(input("b = "))
        while type(b) != int:
            try:
                c = int(c)
            except ValueError:
                print("An error has occurred!")
                c = float(input("c = "))
                           
    validate_param(a,b,c)
                
    def discriminant(a,b,c):
         d = b ** 2 - 4 * a * c
         return d
    discriminant(a,b,c)

    d = discriminant(a,b,c)
    def roots(d,a,b,c):
        roots = d, a**0.5, b**0.5, c**0.5
        return roots
    roots(d,a,b,c)

    def solv_square(a, b, c) -> roots:
        if d >= 0:
            return ("x1= ",(-b + sqrt(d))/(2*a), "x2= ",(-b - sqrt(d))/(2*a))
        if d < 0:
            return ("x= ", (-b/(2*a)))

    solv_square(a, b, c)

    def square_print(a, b, c, roots):
         print("Discriminant= " + str(discriminant(a,b,c)))
         print(solv_square(a,b,c))
         #print(roots(d,a,b,c))

    square_print(a,b,c,roots)

#Solver()
main()
