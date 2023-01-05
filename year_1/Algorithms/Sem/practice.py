# Let's implement divimp as a sum broo

def work_list(lista, st, dr):
    if(st == dr):
        return lista[st]
    middle = (st + dr) // 2
    return work_list(lista, st, middle) + work_list(lista, middle+1, dr)

if __name__ == '__main__':
    f = open("inputline.txt", "r")
    while True:
        list = f.readline()
        numere = [int(element) for element in list.split()]
        if not list:
            break
        # Here we have our list
        print(work_list(list, 0, len(list)-1))