def interchangeXandYbitwise(ics, ygrak):
    ics = ics ^ ygrak
    ygrak = ics ^ ygrak
    ics = ics ^ ygrak
    print(f"X = {ics}, Y = {ygrak}", sep="\n")
    
def secondExercise(xer):
    # And-uirea cu n-1 sterge ultimul bit de 1 din n
    xer = (xer & (xer-1))
    if(xer == 0):
        print(f"Number was power of 2 - {bin(xer)}"
              )
    else:
        print(f"Number was not a power of 2 - {bin(xer)}")

def secondExerciseOfficial(xer):
    n = xer
    aux = n 
    k = 0 
    while aux & 1 == 0: 
        aux = aux >> 1 # We bithift right until the first bit is 1
        k = k + 1 
 
    if aux == 1: 
        print("Numarul", n, "este egal cu 2**", k) 
    else: 
        print("Numarul", n, "nu este o putere a lui 2")

def thirdExercise(xer):
    k = 0
    while xer:
        k = k+1
        xer = xer & (xer-1)
    print(f"Number of bits of 1: {k}", sep="\n")
    
def fourthExercise(xer):
    # Longest sequence of bits equal to 1
    k = 0
    while xer != 0:
        xer = xer & (xer >> 1)
        k = k+1
    print(f"Lungimea maxima a unei secvente de biti este {k}")
    
def main():
    x = int(input("x = "))
    fourthExercise(x)
    
if __name__ == "__main__":
    main();    