def exercise1():
    # Read file test.in line by line
    file = open("test.in", "r")
    while True:
        line = file.readline()
        if not line:
            break
        determine_if_good(line)

def determine_if_good(line):
    line = line.split("=")
    line1 = line[0].split("*")
    # Remove '\n' from line[1]
    if line[1][-1] == '\n':
        line2 = line[1][:-1]
    else:
        line2 = line[1]

    
    if int(line1[0]) * int(line1[1]) == int(line2):
        file = open("test.out", "a")
        file.write(line1[0] + "*" + line1[1] + "=" + line2 + " Good\n")
    else:
        file = open("test.out", "a")
        file.write(line1[0] + "*" + line1[1] + "=" + line2 + " Bad" + ", Correct: " + str(int(line1[0]) * int(line1[1])) + "\n")
    
def exercise3():
    x = input("Please insert your proposition: ")
    x = x.split(" ")
    dictionary = {}
    for element in x:
        dictionary = {element: x.count(element)}

    dictionarykey = {x : [y[0] for y in dictionary.items() if y[1] == x] for x in dictionary.values()}
    print(min(dictionarykey[min(dictionarykey)]))
    print(max(dictionarykey[max(dictionarykey)]))

def exercise4():
    d1 = {}
    d2 = {}
    S = d1.keys | d2.keys
    D = {k: d1.get(k, 0) + d2.get(k, 0) for k in S}

def exercise6():
    ins = input("Please insert your numbers: ")
    ins = ins.split(" ")
    ins = [int(x) for x in ins]
    listtuples = [(ins[k], ins[k+1]) for k in range(len(ins)-1)]
    print(listtuples)

def exercise7():
    listtablainmultirii = [[f"{x} * {y} = {x * y}" for x in range(1, 11)] for y in range(1, 11)]
    print(listtablainmultirii)

class object:
    def __init__(self):
        self.name = "Azdolf Hitler"

    def __str__(self):
        return self.name

def exercise10():
    # Sort list using lambda function
    o = object()
    list = [1, 4, 2, 4, 5, "", 3, 7, "Ana are mere",45, o,3, 10, ]
    list.sort(key=lambda x: str(x))
    print(list)

def exercise11():
    L = [(1, 2), (3, 4), (5, 6), (7, 8), (9, 10)]
    L.sort(key=lambda x: (x[1], x[0])) # Sort by second element, then by first element

    L = [325, 412, 313]
    L.sort(key=lambda x: x%10) # Le ordoneaza dupa ultima cifra

if __name__ == "__main__":
    exercise10()