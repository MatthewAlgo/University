from cmath import nan
from math import *


def exc1(a, b):
    a = a^b
    b = a^b
    a = a^b
    print(str(a) + str(b))

def exc2(a):
    k = 0
    ok = 0
    while a > 0:
        if a & 1 == 1:
            if(a == 1):
                print(k)
                ok = 1
                break
        a = a >> 1
        k = k + 1
    if (not ok):
        print("The number is not a power of 2")

def exc3(sir):
    final = 0
    for value in sir:
        final = final ^ value
    print(final)

def exc4(number, bitposition):
    print(bin(number))
    k = 1
    aux = 0
    while (number > 0):
        if(bitposition != k):
            aux = ((1 << (k-1)) * (number & 1)) + aux
        number = (number >> 1)
        k = k + 1
    print(bin(aux))

def exc5(number):
    cnt = 0
    while(number != 0):
        number = number & (number - 1)
        cnt = cnt + 1
    print(cnt)

def exc6(n):
    # We select each subset based on the binary representation of a number
    # We declare a final variable
    final = 0
    # And create the number until we count to
    k = (1 << (n))
    # We will load our elements inside an array
    vector = []
    for x in range(1, n+1):
        y = int(input(f"vectorelement {x} = "))
        vector.append(y)
    # And for each number we get its binary representation, each number of 1 representing an occurrence in the current subset
    for a in range(1, k):
        copya = a # We have a copy of number a
        contor_position = 0
        print("(", end=" ")
        while copya > 0:
            # We can xor the values dirrectly as we get them because of associativity
            if copya & 1 == 1 and contor_position < len(vector):
                final = (final ^ vector[contor_position])
                print(f"{vector[contor_position]}, ", end=" ")
            # We consume the number bitshifting it to the right
            copya = (copya >> 1)
            contor_position = (contor_position + 1)
        print(")")
    print(f"Final value of all the elements xorred is: {final}")

def language1(number):
    if(number == number[::-1]):
        print("Da")
    else:
        print("Nu")

def language2(string_numbers) -> None:
    number_array_string = string_numbers.split()
    prev_value = -1
    position = 1
    maxi = 0
    arrayofindexes = []
    for value in number_array_string:
        value = float(value)
        if position == 1:
            prev_value = value
        else:   
            if (abs(value-prev_value) > maxi):
                maxi = abs(value-prev_value)
                arrayofindexes.clear()
                arrayofindexes.append(position)
            elif(abs(value-prev_value) == maxi):
                arrayofindexes.append(position)
        position = position + 1
    print(arrayofindexes)
    print(maxi)

def language3(a, b):
    # Facem CMMDC-ul celor 2 numere
    ca = a
    cb = b
    r = a % b
    while r!=0:
        a = b
        b = r
        r = a%b
    print(ca / b * cb / b)    

def language4(a, b, c):
    if(b**2 - 4 * a * c < 0):
        print("Complexe")
    else:
        x1 = -b + sqrt(b ** 2 - 4 * a * c)
        x2 = -b - sqrt(b ** 2 - 4 * a * c)
        if(x1 == x2):
            print("Radacina dubla")
        elif(x1 != x2):
            print("Doua radacini")

def isPrime(num):
    if num > 1:
        # Iterate from 2 to n / 2
        for i in range(2, int(num/2)+1):
            # If num is divisible by any number between
            # 2 and n / 2, it is not prime
            if (num % i) == 0:
                return 0
        else:
            return 1
    else:
        return 0

def language5(a, b):
    max = 0
    for var in range(b+1, a, -1):
        if(isPrime(var)):
            max = var
    return var

def language6(string):
    desired_array = [int(numeric_string) for numeric_string in string]
    print(max(desired_array) + " " + min(desired_array))

def main():
    x = int(input("Insert x: "))
    y = int(input("Insert y: "))
    # x = input("Please insert the string")
    z = int(input("Insert z: "))

    language4()


if __name__ == "__main__":
    main()