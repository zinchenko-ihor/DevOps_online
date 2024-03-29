#Importing the library math
import math

def validate_param():                                                    # function validate_param without parameters
    attem = 3                                                            # declare a variable and assign the value 3
    while attem > 0:                                                     # loop while the value of the variable is greater than 0
        try:                                                             # Try construct - except for the ability to handle exceptions
            print ("You have " + str(attem) + " attempts")               # displaying the number of attempts
            a = int(input("a = "))                                       # data input
            b = int(input("b = "))                                       # data input
            c = int(input("c = "))                                       # data input

        except ValueError:                                               # try construct - except for the ability to handle exceptions
            print("An error has occurred! Value is not integer!")        # displaying errors
            attem -= 1                                                   # decreasing the value of the variable by 1
            continue                                                     # continue execution of the cycle
        else:                                                            # if the weekend has finished execution, then
            return a, b, c                                               # return the value of variables a, b, c             
    
def discriminant(a, b, c):                                               # function discriminant with parameters a,b,c
    d = b ** 2 - 4 * a * c                                               # discriminant calculation formula
    return d                                                             # return the value of variable d

def roots(d, a, b, c):                                                   # function roots with parametrs d, a, b, c
    if d > 0:                                                            # if the discriminant is greater than 0, then
        x1 = (-b + math.sqrt(d)) / (2 * a)                               # root x1 is calculated by this formula
        x2 = (-b - math.sqrt(d)) / (2 * a)                               # root x2 is calculated by this formula
        print("x1 = %.2f \nx2 = %.2f" % (x1, x2))                        # displaying values of roots x1 and x2
        return x1, x2                                                    # return the value of variables x1, x2
    elif d == 0:                                                         # if the discriminant is zero, then
        x = -b / (2 * a)                                                 # only one root x and is calculated by this formula
        print("x = %.2f" % x)                                            # displaying value of root x
        return x                                                         # return the value of variable х
    else:                                                                # Otherwise, there are no roots in the equation
        print("No roots!")                                               # displaying message

def solv_square(a, b, c) -> roots:                                       # function solv_square with parameters a,b,c 
    d = discriminant(a,b,c)                                              # assign the result of the function discriminant to a variable d
    root = roots(d,a,b,c)                                                # assign the result of the function roots to a variable root
    return root                                                          # return the value of variable root

def square_print(a, b, c, roots):                                        # function square_print with parameters a,b,c,roots
    print("Discriminant = " + str(discriminant(a,b,c)))                  # output of the result of the discriminant function
    print (roots)                                                        # output of the result of the roots function

def main():                                                              # function main
    print("Enter coefficients for the equation ax^2 + bx + c = 0:")      # displaying message
    valid_params = validate_param()                                      # passing the value of the function execution to a variable
    a = valid_params[0]                                                  # 
    b = valid_params[1]                                                  #
    c = valid_params[2]                                                  # 
    solv_square(a, b, c)                                                 # function solv_square call with arguments a,b,c
    square_print(a, b, c, roots)                                         # function square_print call with arguments a,b,c,roots

if __name__ == "__main__":                                               # all lines in the if __name__ == '__main__' block are not absorbed during import.
    main()                                                               # function main call without arguments
     
    



          
