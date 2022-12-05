numbers_in_a_glob = []

def read_from_file():
    file = open("fisier.txt")
    numere = []
    for line in file:
        numere = line.split()
    return numere

def solve(x0):
    numbers_in_a = numbers_in_a_glob
    numbers_in_a = [int(x) for x in numbers_in_a]
    
    if(x0 >= 1):
        # We consider the numbers in increasing order
        numbers_in_a.sort(reverse=True)
    elif(x0 >= 0 and x0 < 1):
        numbers_in_a.sort()
    elif(x0 <= -1 and len(numbers_in_a) %2 == 0):
        # Smallest-biggest
        final_array = []
        numbers_in_a.sort()
        parity = 0
        while(len(numbers_in_a) > 0):
            if(parity % 2 == 0):
                final_array.append(numbers_in_a[0])
                numbers_in_a = numbers_in_a[1:]
            else:
                final_array.append(numbers_in_a[-1])
                numbers_in_a = numbers_in_a[:-1]
            parity += 1
        return final_array
    elif(x0 <= -1 and len(numbers_in_a) %2 == 1):
        # Biggest-smallest
        final_array = []
        numbers_in_a.sort()
        parity = 0
        while(len(numbers_in_a) > 0):
            if(parity % 2 == 1):
                final_array.append(numbers_in_a[0])
                numbers_in_a = numbers_in_a[1:]
            else:
                final_array.append(numbers_in_a[-1])
                numbers_in_a = numbers_in_a[:-1]
            parity += 1
        return final_array
    elif(x0 > -1 and x0 < 0):
        numbers_in_a.sort()
        
        final_array = []
        paritate = 0
        
        if(len(numbers_in_a) % 2 == 0):
            left = int(len(numbers_in_a) / 2)-1
            right = left + 1
            # Ceva mai mic, dupa ceva mai mare
            while paritate != len(numbers_in_a):
                if(paritate % 2 == 0):
                    final_array.append(numbers_in_a[left])
                    left = left-1
                else:
                    final_array.append(numbers_in_a[right])
                    right = right+1
                paritate += 1
            return final_array
        else:
            # Ceva mai mare, dupa ceva mai mic
            left = int(len(numbers_in_a) / 2)-1
            right = left + 2
            
            # Append-uim mijlocul intai
            final_array.append(numbers_in_a[left+1])
            
            while paritate <= int(len(numbers_in_a) - 2):
                if(paritate % 2 == 0):
                    final_array.append(numbers_in_a[left])
                    left = left-1
                else:
                    final_array.append(numbers_in_a[right])
                    right = right+1
                paritate += 1
            return final_array
    return numbers_in_a
                
            
    
        
if __name__ == '__main__':
    numbers_in_a_glob = read_from_file()
    print("Coeficientii:", end=" ")
    print(solve(-60))
    