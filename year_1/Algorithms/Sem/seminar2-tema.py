
def exercise1():
    x = input("Please enter your word: ")
    y = [x for x in input("Please enter your list of words: ").split()]
    for word in y:
        if(len(x) == len(word)):
            print(word)
            
def exercise2():
    y = [x for x in input("Please enter your phrase: ").split()]
    separators = ", . : ; ? !"
    index = -1
    counter = 0
    for word in y:
        index += 1
        word = word.lower()
        for sep in separators.split():
                if sep in word:
                    word = word.replace(sep, " ")
        word = word.strip()
        y[index] = word
    
    print(y)
    # Remove duplicates from list y
    y = list(dict.fromkeys(y))
    print(len(y))

def exercise3():
    phrase = [x for x in input("Please enter your list of words: ").split()]
    dictionary = {}
    for word in phrase:
        # For each letter in the word
        for i in range(len(word)):
            # If the letter is in the dictionary
            if word[i] in dictionary:
                # If the word is not in the dictionary
                dictionary[word[i]] += 1
            else:
                dictionary[word[i]] = 1
                
    for key in dictionary:
        print(key, '->', dictionary[key])

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
    
def main():
    str = caesar_encrypt("Ana are mere si ta-su este zigga bigga", 24)
    print("Encrypted: ", str)
    str = caesar_decrypt(str, 24)
    print("Decrypted: ", str)
    
if __name__ == '__main__':
    main()