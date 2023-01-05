########## Pentru nota 5
def s1_a(nume):
    def citire_numere(nume_fis):
        f = open(nume_fis, "r")
        lista_de_liste = []
        while True:
            line = f.readline()
            line = [int(x) for x in line.strip().split()]
            if not line:
                break
            lista_de_liste.append(line)
        return lista_de_liste
    return citire_numere(nume_fis=nume)

def prelucrare_lista(lista_de_liste):
    # Din fiecare sublista se vor elimina valorile minime
    # Din fiecare sublisa se vor pastra doar m elemente (lungimea minima a unei sublise)
    secondary_sublist = []
    for sublista in lista_de_liste:
        # Selectam minimum din lista
        minim = min(sublista)
        pozmin = sublista.index(minim)
        while(pozmin != -1):
            sublista.pop(pozmin)
            try:
                pozmin = sublista.index(minim)
            except ValueError:
                break
        secondary_sublist.append(sublista)

    minim_length = min([len(sublist) for sublist in secondary_sublist])
    for i in range(0, len(secondary_sublist)):
        secondary_sublist[i] = secondary_sublist[i][:minim_length]

    return secondary_sublist

def ecran_ex_3(lista_prelucrata):
    for sublista in lista_prelucrata:
        for element in sublista:
            print(element, end=" ")
        print()

def haide_sa_luam_5(lista_citita, k):
    boolean = False
    setul = set()
    for sublista in lista_citita:
        for element in sublista:
            # Trebuie sa vedem daca elementul are k litere
            if(len(str(element)) == k):
                boolean = True
                # print(element, end=" ")
                setul.add(element)
    if boolean == False:
        print("Imposibil!")
    else:
        for element in sorted(setul, key=lambda x : -x):
            print(element, end=" ")

#######
# De la 5 incolo

def rezolvare_subiect_2_pct_1(nume_fis):
    # Punem datele din fisier intr-o structura de date decenta
    # Ma gandesc intr-un dictionar de liste de liste
    def citire_linie(nume_fis):
        f = open(nume_fis, "r")
        lista_de_liste = []
        dict_de_liste = {}
        while True:
            line = f.readline()
            if not line:
                break
            line = [element.strip() for element in line.strip().split('%')]
            # Ar fi frumos sa avem orele intr-o lista separata
            ore = [ora for ora in line[2].split()]
            linie_fin = line[:2] + ore # Linia finala pe care o append-uim la cea mare

            # Ar fi fost frumos, totusi, sa avem si un dictionar care sa contina liste
            if line[0] in dict_de_liste:
                dict_de_liste[line[0]].append(linie_fin[1:])
            else:
                dict_de_liste[line[0]] = [linie_fin[1:]]

            lista_de_liste.append(linie_fin)
        return dict_de_liste
    return citire_linie(nume_fis=nume_fis)

def sterge_ore(dictionar_de_liste, cinema, film, multime_ore):
    lista_de_liste_noua = []
    index = 0
    boolean = False
    for nume_ore in dictionar_de_liste[cinema]:
        if film == nume_ore[0]:
            # Am gasit, deci ii stergem orele specificate in multime_ore
            lista_de_liste_noua = [film]
            for ora in nume_ore[1:]:
                if ora not in multime_ore:
                    lista_de_liste_noua.append(ora)
            boolean = True
            break
        index+=1
    if boolean:
        dictionar_de_liste[cinema].pop(index)
        dictionar_de_liste[cinema].append(lista_de_liste_noua)
    return dictionar_de_liste
    



def transformare_in_minute(ora):
    ora_list = [element for element in ora.split(':')]
    return int(ora_list[0] * 60) + int(ora_list[1])

def cinema_film(dictionar_de_liste, *nume_cinema, ora_minima, ora_maxima):
    list_of_tuples = []
    for cinematograf in nume_cinema:
        for cinema_ore in dictionar_de_liste[cinematograf]:
            for ora in cinema_ore[1:]:
                # Transformam ora in minute
                minute_ora = transformare_in_minute(ora)
                minute_ora_minima = transformare_in_minute(ora_minima)
                minute_ora_maxima = transformare_in_minute(ora_maxima)
                if(minute_ora >= minute_ora_minima and minute_ora <= minute_ora_maxima):
                    # Verificam daca nu cumva tuplul nostru deja se afla in lista
                    boolean = False
                    for tuple in list_of_tuples:
                        if(tuple[0] == cinema_ore[0] and tuple[1] == cinematograf and tuple[2] == cinema_ore[1:]):
                            boolean = True # Tuplul deja se afla aici
                    if not boolean:
                        list_of_tuples.append((cinema_ore[0], cinematograf, cinema_ore[1:]))
    
    # Acum aranjam lista noastra potrivit cerintei
    list_of_tuples.sort(key=lambda tuple : (tuple[0], -len(tuple[2])))
    return list_of_tuples


if __name__ == '__main__':
    # print(s1_a("numere.in"))
    # print(prelucrare_lista(s1_a("numere.in")))
    # ecran_ex_3(prelucrare_lista(s1_a("numere.in")))
    # k = int(input("Inserati K: "))
    # haide_sa_luam_5(s1_a("numere.in"), k)

    print(rezolvare_subiect_2_pct_1("cinema.in"))
    # print(sterge_ore(rezolvare_subiect_2_pct_1("cinema.in"), "Cinema 1", "Minionii 2", ["12:30"]))
    print(cinema_film(rezolvare_subiect_2_pct_1("cinema.in"), "Cinema 1", "Cinema 2", ora_maxima="22:00", ora_minima="14:00"))