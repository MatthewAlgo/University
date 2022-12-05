def exercise1(t):
    x = input("Please enter your string: ")
    p = x.find(t)
    while p != -1: 
        print(p) 
        p = x.find(t, p + len(t)) 

def exercise2(w, p, n):
    # x = input("Please enter your word: ")
    # y = int(input("Please enter your number: "))
    # z = [x for x in input("Please enter your list: ").split()]
    stringtosearchfor = w[len(w)-p:]
    for word in n:
        x = word.find(stringtosearchfor, len(word) - p)
        if(x != -1):
            print(word)
            
def exercise3():
    text = input("Propozitia: ") 
    separatori = ",.:;?!" 
    lmax = -0
    rezultat = " "
    for x in separatori: 
        text = text.replace(x, " ")
        
    for cuvant in text.split(): 
        if(len(cuvant) > lmax):
            lmax = len(cuvant)
            rezultat = cuvant + " "
        elif (len(cuvant) == lmax):
            if cuvant not in rezultat:
                rezultat += cuvant + " " 
    rezultat = rezultat.strip()
    print("Distinct words of max length:", " ".join(rezultat.split()))

def exercise4():
    s = input("Titlul: ") 
 
    # eliminăm spațiile de la începutul și sfârșitul șirului, 
    # după care transformăm toate literele în minuscule 
    s = s.strip().lower() 

    # transformăm prima literă în majusculă - cazul a) 
    s = s[0].upper() + s[1:] 
    
    # căutăm ultimul cuvânt din titlu (începe după ultimul spațiu) 
    # și îi transformăm prima literă în majusculă - cazul a) 
    p = s.rfind(" ") 
    if p != -1: 
        s = s[:p+1] + s[p+1].upper() + s[p+2:] 
    
    exceptii = " a an by on in at to for ago the past over into onto " 
    
    # căutăm primul spațiu 
    p = s.find(" ") 
    while p != -1: 
        # căutăm următorul spațiu 
        q = s.find(" ", p + 1) 
        if q != -1: 
            # extragem în cuvântul curent și eliminăm eventualul semn 
            # de punctuație de la sfârșitul său 
            cuv = s[p + 1: q].strip(" ,.:;?!") 
            # transformăm în majusculă prima literă a cuvântului curent 
            # dacă suntem într-unul dintre cazurile b) sau c) 
            if len(cuv) >= 5 or (len(cuv) < 5 and 
                                 " " + cuv + " " not in exceptii): 
                s = s[:p+1] + s[p+1].upper() + s[p+2:] 
        p = q 
    
    print("Titlul formatat: " + s)

def exercise5():
    s = input("Șirul s: ") 
    n = len(s) 
    for d in range(1, n//2 + 1): 
        if n % d == 0: 
            t = s[:d] * (n//d) 
            if t == s: 
                print("t = ", s[:d], "\nk = ", n//d) 
                break 
        else: 
            print("Imposibil!") 
    
    
def main():
    exercise5()
    
if __name__ == "__main__":
    main()