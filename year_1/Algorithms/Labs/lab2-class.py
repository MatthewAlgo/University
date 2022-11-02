
from itertools import count


def exercise1():
    x = input("Please insert your word: ")
    first = x[0]
    lista = list(x)
    while first in lista:
        lista.remove(first)
    stringfinal = "".join(lista)
    print(stringfinal)
    
def exercise1_second():
    x = input("Please insert your word: ")
    first = x[0]
    x = x.replace(first, '')
    print(x)

def exercise2():
    x = input("Please insert substring: ")
    y = input("Please insert your string: ")
    occurence = y.find(x)
    while occurence > -1:
        print(occurence)
        occurence = y.find(x, occurence+1)
        
def exercise2_index():
    x = input("Please insert substring: ")
    y = input("Please insert your string: ")
    occurence = -1
    while occurence > -2:
        try:
            occurence = y.index(x, occurence+1)
            print(occurence)
        except ValueError:
            break
def exercise3():
    x = input("Please insert string: ")
    for i in range(0, int(len(x) / 2)):
        print(x[i:len(x)-i].center(len(x)))
        
def exercise4():
    x = input("Please insert your proposition: ")
    w = input("Please enter your wrong word: ")
    c = input("Please enter your correct word: ")
    x = x.replace(w, c)
    print(x)
    
def exercise4_sec():
    x = input("Please insert your proposition: ")
    w = input("Please enter your wrong word: ")
    c = input("Please enter your correct word: ")
    x = x.replace(w, c, 2)
    if x.find(w) > -1:
        print("Prea multe greseli de corectat")
    else:
        print("Greselile au fost corectate")
        print(x)    
        
def exercise5():
    x = input("Please insert your proposition: ")
    s = input("Please enter your word: ")
    t = input("Please enter your word: ")
    s = s.strip()
    t = t.strip()
    list = x.split()
    index = -1
    for element in list:
        index += 1
        if element == s:
            list[index] = t
    x = " ".join(list)
    print(x)

def exercise6():
    x = input("Enter your encoded text: ")
    x = list(x)
    finalString = ""
    number = 0
    for element in x:
        if element.isdigit():
            number = number*10 + int(element)
        else:
            character = element
            finalString = finalString + (number*character)
            number = 0
    print(finalString)

def exercise7():
    x = input("Enter your encoded text: ")
    x = list(x)
    finalString = ""
    suma = 0
    number = 0
    for element in x:
        if element.isdigit():
            number = number*10 + int(element)
        else:
            suma += number
            number = 0
    print(f"{suma} RON")
    
def exercise8():
    x = input("Enter Name and Surname")
    nume_prenume = x.split()
    if(not(len(nume_prenume) == 2)):
        print("False")
        return
    else:
        for nume in nume_prenume:
            separate = nume.split("-")
            if(len(separate) > 2):
                print("False")
                return
            else:
                for nume in separate:
                    if(not (nume == nume.lower().title())):
                        print("False")
                        return;
    print("True")

def caesar_encrypt(text, shift):
    result = ""
    for i in range(len(text)):
        char = text[i]
        # A-Z = 65-90
        # a-z = 97-122
        if (char.isupper() and char.isalpha()):
            result += chr((ord(char) + shift - 65) % 26 + 65)
        elif(char.islower() and char.isalpha()):
            result += chr((ord(char) + shift - 97) % 26 + 97)
        else:
            result += char
    return result

def caesar_decrypt(text, shift):
    result = ""
    for i in range(len(text)):
        char = text[i]
        # A-Z = 65-90
        # a-z = 97-122
        if (char.isupper() and ord(char) in range(65, 91)):
            result += chr((ord(char) - shift - 65) % 26 + 65)
        elif(char.islower() and ord(char) in range(97, 123)):
            result += chr((ord(char) - shift - 97) % 26 + 97)
        else: 
            result += char
    return result

def exercise10():
    x = input("Enter word1: ")
    y = input("Enter word2: ")
    lx = list(x)
    ly = list(y)
    dict = {}
    for letter in lx:
        if(not(x.count(letter) == y.count(letter))):
            print("False")
            return
    for letter in ly:
        if(not(y.count(letter) == x.count(letter))):
            print("False")
            return
    print("True")

def exercise11_pasareasca():
    x = input("Enter phrase: ")
    vowels = ['a', 'e', 'i', 'o', 'u']
    lista = list(x)
    index = -1
    for element in lista:
        index+=1
        if element in vowels:
            lista[index] = element + 'p' + element
    x = "".join(lista)
    print(x)

def main():
    exercise11_pasareasca()
if __name__ == "__main__":
    main()