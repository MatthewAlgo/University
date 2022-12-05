def cheieProfit(p):
    return p[2]

if __name__ == '__main__':
    fin = open("proiecte.in")

    lp = []
    for linie in fin:
        aux = linie.split()
        lp.append((aux[0], int(aux[1]), float(aux[2])))
        
    fin.close()
    lp.sort(key=cheieProfit, reverse=True)
    
    # Calculăm numărul maxim de zile în care putem
    # să planificăm proiectele
    zi_max = max([p[1] for p in lp])
    # Planificarea optimă va fi construită folosind un dicționar# cu intrări de forma zi: proiect
    planificare = {k: None for k in range(1, zi_max+1)}
    
    profit = 0
    
    for proiect in lp:
        for z in range(proiect[1], 0, -1):
            if planificare[z] is None: 
                planificare[z] = proiect
                profit += proiect[2]
                break
            
    fout = open("proiecte.out", "w")
    
    currentday = 1
    for z in planificare:
        if planificare[z] != None:
            fout.write("Ziua " + str(currentday) + ": " + str(planificare[z][1]) + " " +str(planificare[z][2]) + "\n")
            currentday+=1
    
    fout.write("\nProfit maxim: " + str(profit))
    fout.close()