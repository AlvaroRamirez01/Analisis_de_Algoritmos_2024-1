def sumaPrimerosN(n):
    acumulador = 0
    for i in range(1, n+1):
        acumulador += i*3
    return acumulador

print(sumaPrimerosN(5))