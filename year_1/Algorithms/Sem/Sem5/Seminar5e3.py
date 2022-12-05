intervale = []
reunion = []
lungime_autostrada_glob = 0
lungime_interval_glob = 0

def sortareKey(p):
    return p[0], -p[1]

def read_from_file():
    fisier = open("autostrada.in")
    counter = 0
    for linie in fisier:
        if counter == 0:
            aux = linie.split()
            lungime_autostrada = aux
        else:
            aux = linie.split()
            intervale.append((int(aux[0]), int(aux[1])))
        counter+=1
    fisier.close()
    return lungime_autostrada[0]
    
def solve():
    intervale.sort(key=sortareKey) # Crescator dupa capetele din stanga si descrescator dupa capatul din dreapta
    minr = intervale[0][0]
    maxr = intervale[0][1]
    lungime_interval = maxr-minr
    
    for i in range(1, len(intervale)):
        if intervale[i][1] <= maxr:
            continue
        elif intervale[i][0] < maxr:
            lungime_interval += intervale[i][1] -maxr
            maxr = intervale[i][1]
        else:
            lungime_interval += intervale[i][1] -intervale[i][0]
            reunion.append((minr, maxr))
            minr = intervale[i][0]
            maxr = intervale[i][1]
    reunion.append((minr, maxr))
    return lungime_interval
    
def write_end():
    fout = open("autostrada.out", "w")
    for icrt in reunion:
        fout.write("[{}, {}]\n".format(icrt[0], icrt[1]))
    fout.write("\n")  
    compute_unaffected_portions(lungime_autostrada_glob, fout)
    fout.write("\nGrad de uzura: " + str(int(float(lungime_interval_glob/int(lungime_autostrada_glob)) * 100)) + "%")
    fout.close()
        
def compute_unaffected_portions(length, file):
    left = 0
    for item in reunion:
        if(item[0] > left):
            file.write("({}, {})\n".format(left, item[0]))
        left = item[1]
        
    if(left!=length):
        file.write("({}, {})\n".format(left, length))
            
if __name__ == '__main__':
    lungime_autostrada_glob = read_from_file()
    lungime_interval_glob=solve()
    write_end()