def sem3_1():
    x = input("Enter your first string: ")
    y = input("Enter your second string: ")
    frequency = {}
    for element in y:
        if element in frequency:
            frequency[element] += 1
        else:
            frequency[element] = 1
    for element in x:
        if element in frequency:
            frequency[element] -= 1
        else:
            frequency[element] = 1
    
    for element in frequency:
        if frequency[element] != 0:
            print("The strings are not anagrams")
            return
    print("The strings are anagrams")

def sem3_2():
    x = input("Enter your first string: ")
    y = input("Enter your second string: ")
    frequency = {}
    for element in y:
        if element in frequency:
            frequency[element] += 1
        else:
            frequency[element] = 1
    for element in x:
        if element in frequency:
            frequency[element] -= 1
        else:
            frequency[element] = 1
    
    for element in frequency:
        if frequency[element] != 0:
            print("The strings are not anagrams")
            return
    print("The strings are anagrams")
    print("Permutation w1->w2")
    dictionary = {}
    index = -1
    for letter in list(x):
        index += 1
        dictionary[letter] = index+1 # Sets the position in the first string here
    index = 0 
    for letter in list(y):
        index += 1
        print(f"Letter {index} -> {dictionary[letter]}")
    
    print("Permutation w2->w1")
    dictionary_word_2 = {}
    index = -1
    for letter in list(y):
        index += 1
        dictionary_word_2[letter] = index+1 # Sets the position in the first string here
    index = 0 
    for letter in list(x):
        index += 1
        print(f"Letter {index} -> {dictionary_word_2[letter]}")

def sem3_3():
    signs = ",!?;:@#$%^*()"
    file = open("exemplu.txt")
    s = file.readline()
    
    stringcat = s
    # We process the first line of the file
    while s != "": 
        s = file.readline() 
        stringcat += s
    
    for item in list(signs):
        stringcat = stringcat.replace(item, " ")
    wordlist = stringcat.split()
    
    dictionary = {}
    for word in wordlist:
        if len(word) not in dictionary:
            dictionary[len(word)] = [word]
        else:
            dictionary[len(word)].append(word)
    
    for item in dictionary:
        print(f"Item {item} -> {dictionary[item]}")
        
def sem3_4():
    file = open("numere.txt")
    s = file.readline()
    
    stringcat = s
    # We process the first line of the file
    while s != "": 
        s = file.readline() 
        stringcat += s
    dictionar = {}
    wordlist = stringcat.split()
    for number in wordlist:
        for digit in list(number):           
            if ord(digit) in dictionar:
                dictionar[ord(digit)] += 1
            else:
                dictionar[ord(digit)] = 1
    print("Maxim:", end=" ")              
    for digit in range(ord('9'), ord('0') -1 , -1):
        if digit in dictionar:
            print(chr(digit)*dictionar[digit], end="")
    print("\nMinim:", end=" ")
    
    for digit in range(ord('1'), ord('9') +1):
        if digit in dictionar:
            mini = digit
            break
    dictionar[mini] -= 1
    print(chr(mini), end="")
    while dictionar[ord('0')] > 0:
        print("0", end="")
        dictionar[ord('0')] -= 1
        
    for digit in range(ord('9'), ord('0') -1 , -1):
        if digit in dictionar:
            print(chr(digit)*dictionar[digit], end="")


################################

def computematrix(size):
    x = [ [0 for x in range(size)] for y in range(size) ]
    for i in range(size):
        x[size-1][i] = x[i][size-1] = 1
    for j in range(size-2, -1, -1):
        for i in range(size-2, -1, -1):
            x[i][j] = x[i][j+1] + x[i+1][j]
    
def sem4_1():
    computematrix(4)
    
###############################
def find_positive_in_tuple(tup):
    x = []
    index = -1
    for x in tup:
        index += 1
        if x > 0:
            x.append(index)
    return x

def find_positions_of_punctuation(string):
    x = []
    index = -1
    puncts = ",!?:;."
    for punc in list(puncts):
        while string.find(punc):
            x.append(string.find(punc))
            string = string.replace(punc,"", 1)
    print(x)
                

def sem4_2():
    
    
def main():
    sem4_1()
if __name__ == '__main__':
    main()
    