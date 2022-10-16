def firstExercise(n):
    vector = []
    for x in range(0, n):
        y = int(input(f"vectorelement {x} = "))
        vector.append(y)
        
    finalvalue = 0
    for value in vector:
        finalvalue = finalvalue ^ value
    print(f"Number Odd Times {finalvalue}")
        
def secondExercise(n):
    # Generate subsets using backtracking
    # Basically we select elements based on bits (counting)
    final = 0
    # 0b0001010111111
    k = 1 << (n)
    vector = []
    for x in range(1, n):
        y = int(input(f"vectorelement {x} = "))
        vector.append(y)

    for a in range(1, k):
        copya = a # We have a copy of number a
        contor_position = 0
        while copya != 0:
            if copya & 1 == 1:
                final = (final ^ vector[contor_position])
            copya = (copya >> 1)
            contor_position = (contor_position + 1)
    print(f"Final value of all the elements xorred is: {final}")

def thirdExercise():
    x = int(input("x = "))
    y = int(input("y = "))
    t = x ^ y
    k = 0
    while t != 0:
        t = t & (t-1) # We eliminate the last bit of the number
        k = k + 1
    print(f"Number of bits from x switched to become y: {k}")
    
# 4. Fie 𝑛 un număr natural. Să se determine cea mai mică putere a lui 2 mai mare sau egală 
# decât  numărul 𝑛.

def fourthExerise(number):
    # We need to get the position of the last bit of 1 from the representation
    counter = 0
    cntchange = 0
    while number != 0:
        if (number & 1 == 1):
            finalpos = counter
            cntchange = cntchange + 1
        number = number >> 1
        counter = counter + 1
    if cntchange > 1:
        print(f"Power of 2 greater than or equal to number: {1 << (counter)}")
    else:
        print(f"Power of 2 greater than or equal to number: {1 << (counter-1)}")

def fifthExercise(n):
    print(f"Binary: {bin(n)}")
    opposite = ~n
    print(f"Opposite Binary: {bin(opposite)}")
    k = 0
    while (opposite != 0):
        if opposite & 1 == 1:
            k = k + 1
        opposite = (opposite >> 1)
    print(f"Number of zeros from binary representation: {k}")   
    
def main():
    x = int(input("x = "))
    fifthExercise(x)
    
if __name__ == "__main__":
    main();    