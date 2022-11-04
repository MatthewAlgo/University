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
def number_is_positive(num):
    return num > 0

def find_positive_in_tuple(tup):
    x = []
    index = -1
    for x in tup:
        index += 1
        if number_is_positive(x):
            x.append(index)
    return x


def find_positions_of_punctuation(string):
    x = []
    puncts = ",!?:;."
    for punc in list(puncts):
        while string.find(punc) > -1:
            x.append(string.find(punc))
            string = string.replace(punc," ", 1)
    x.sort() 
    print(x)


def anagram(word1, word2):
    # Check if the two words are anagrams
    dict_w1 = {}
    dict_w2 = {}
    for letter in list(word1):
        if letter in dict_w1:
            dict_w1[letter] += 1
        else:
            dict_w1[letter] = 1
    for letter in list(word2):
        if letter in dict_w2:
            dict_w2[letter] += 1
        else:
            dict_w2[letter] = 1
    
    for key in dict_w1:
        if key in dict_w2:
            if dict_w1[key] != dict_w2[key]:
                return False
        else:
            return False
    return True
    
def positions_anagrams_of_s(string, s):
    separators = "!.,@?#^$&*(){}:;"
    strcopy = string
    for element in list(separators):
        string = string.replace(element, "")
    lis = string.split()
    
    diction = {}
    for word in lis:
        if anagram(word, s):
            print(strcopy.find(word), end=" ")

def sumcif(item):
    return sum([int(x) for x in list(str(item))])

def find_in_list(lis, n, s):
    index = -1
    for item in lis:
        index += 1
        if len(str(item)) == n and sumcif(item) == s:
            print(index, end=" ")
            
###########################
class carte():
    def __init__(self, titlu, autori, an, pret):
        self.titlu = titlu
        self.autori = autori
        self.an = an
        self.pret = pret
    
    def modprice(self, percent):
        if self.an < 2000:
            self.pret = self.pret * percent
def ex_a(lista):
    for item in lista:
        item.modprice(0.8)
        print(item.pret)
        
def ex_b_1(lista):
    for i in range(0, len(lista)-1):
        for j in range(i+1, len(lista)):
            if(lista[i].an < lista[j].an):
                lista[i], lista[j] = lista[j], lista[i]
            elif lista[i].an == lista[j].an:
                if lista[i].titlu > lista[j].titlu:
                    lista[i], lista[j] = lista[j], lista[i]
    return [x.titlu for x in lista]

def ex_b_2(lista):
    for i in range(0, len(lista)-1):
        for j in range(i+1, len(lista)):
            if(len(lista[i].autori) > len(lista[j].autori)):
                lista[i], lista[j] = lista[j], lista[i]
            elif len(lista[i].autori) == len(lista[j].autori):
                if lista[i].pret < lista[j].pret:
                    lista[i], lista[j] = lista[j], lista[i]
    return [x.titlu for x in lista]

def ex_b_3(lista):
    for i in range(0, len(lista)-1):
        for j in range(i+1, len(lista)):
            if(lista[i].autori[0].split()[0] > lista[j].autori[0].split()[0]):
                lista[i], lista[j] = lista[j], lista[i]
            elif (lista[i].autori[0].split()[0] == lista[j].autori[0].split()[0]):
                if(lista[i].autori[0].split()[1] > lista[j].autori[0].split()[1]):
                    lista[i], lista[j] = lista[j], lista[i]
                elif (lista[i].autori[0].split()[1] == lista[j].autori[0].split()[1]):
                    if lista[i].title > lista[j].title:
                        lista[i], lista[j] = lista[j], lista[i]
                    elif lista[i].title == lista[j].title:
                        if lista[i].an > lista[j].an:
                            lista[i], lista[j] = lista[j], lista[i]
                            
    return [x.titlu for x in lista]

#############################
def sem4_4(n, *liste):
    for lista in liste:
        if(len(lista) == n):
            yield lista
            
def solve_for_4():
    x = 5 
    r = sem4_4(x, [5, 1, 7, 3, 7], [2, 3], [-3, 7, 1], [5, 1, 7, 3, 100]) 
    
    list = next(r, None) 
    if list is None: 
        print("Niciun sir nu are valoarea ", x) 
    else: 
        print("Sirurile de valoare ", x, ":") 
        while list is not None: 
            print(list) 
            list = next(r, None)

def sem4_2():
    x = carte("Alabala", ["Mincu Alb", "Ion Bulbert"], 1999, 23)
    y = carte("Master", ["Minu Gro", "Jon Ann"], 2001, 50)
    z = carte("Troll", ["Jonescu Op", "John Doe"], 2000,30)
    lista = [x, y, z]
    
    print(solve_for_4())
    
def main():
    sem4_2()
if __name__ == '__main__':
    main()
    