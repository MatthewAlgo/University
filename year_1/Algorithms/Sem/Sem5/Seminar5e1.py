import random as rand
def generateDoubleSortedMatrix(m, n):
    upperlim = 20
    matrix = [[0 for x in range(0, n)] for y in range(0, m)]
    for x in range(0, m):
        for y in range(0, n):
            lowerval = max(matrix[x-1][y], matrix[x][y-1])+1
            if lowerval >= upperlim:
                upperlim = upperlim * 2
            matrix[x][y] =rand.randint(lowerval, upperlim) 
    for x in range(0, m):
        print(matrix[x], end="\n")
    return matrix
       
def checkifnuminSortedMatrixOnm(num, m, n, matrix):
    for x in range(0, m):
        for y in range(0, n):
            if num == matrix[x][y]:
                print(f"Found at ${x} ${y}")
                return 1
    print("Number not found")
    return -1
    
def checkifnuminSortedMatrixOmlog2n(num, m, n, matrix):
    for x in range(0, m): 
        # We do a binary search on the current row
        left = 0
        right = n-1
        while left <= right:
            middle = int((left+right)/2)
            if(matrix[x][middle] == num):
                print("Found")
                return 1
            if(num < matrix[x][middle]):
                right = middle-1
            elif (num > matrix[x][middle]):
                left = middle+1
    print("Not found")
    return -1

def checkifnuminSortedMatrixOmplusn(num, m, n, matrix):
    # We position in the top right corner
    position = [0, n-1]
    # If the element is smaller, we move to the left, if the element is bigger, we move down
    while matrix[position[0]][position[1]] != num:
        if(num < matrix[position[0]][position[1]]):
            # We move to the left
            position = [position[0], position[1]-1]
        elif(num > matrix[position[0]][position[1]]):
            position = [position[0]+1, position[1]]
        # If the current position is invalid, then exit the loop
        print(position)
        if position[0] == m or position[1] == -1:
            print("Not found")
            return -1
    print("Found")
    return 1
        
            
if __name__ == '__main__':
    mat = generateDoubleSortedMatrix(5, 7)
    print(checkifnuminSortedMatrixOmplusn(10, 5, 7, mat))
    
    