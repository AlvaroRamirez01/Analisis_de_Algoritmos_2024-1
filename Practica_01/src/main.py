# Practica 01: Adoquinamiento
# Autor: Alvaro Ramirez Lopez

import sys
import random

def main():
    n = int(sys.argv[1])
    if n < 1:
        print("El valor de n debe ser mayor a 0")
        exit()
    tablero = [[' ' for _ in range(n)] for _ in range(n)]
    msj = f"""{'-' * 40}\nAdoquinamiento de {n} x {n}\n{'-' * 40}"""
    print(msj)
    adoq_inicial_x = random.randint(0, n-1)
    adoq_inicial_y = random.randint(0, n-1)
    tablero[adoq_inicial_x][adoq_inicial_y] = "@"
    msj_adoquin = f"Adoquin inicial '@' en: ({adoq_inicial_y+1}, {adoq_inicial_x+1})\n{'-' * 40}"
    print(msj_adoquin)
    adoquinamiento(tablero,0, n-1, 0, n-1, adoq_inicial_x, adoq_inicial_y)
    imprime_tablero(tablero)

def imprime_tablero(tablero):    
    print("Se está imprimiendo el tablero\n")
    for fila in tablero:
        print("[" + "][".join(fila) + "]")
    print("\nSe terminó de imprimir el tablero")

def adoquinamiento(tablero, x0, x1, y0, y1, adoq_esp_x,adoq_esp_y):
    if x1 == x0:
        return
    contenido = chr(random.randint(33, 123))
    if x1 - x0 == 1:
        for i in range(x0, x1+1):
            for j in range(y0, y1+1):
                if tablero[i][j] == ' ':
                    tablero[i][j] = contenido
    else:
        mitad_x = (x0 + x1 - 1) // 2
        mitad_y = (y0 + y1 - 1) // 2
        i1 = i2 = i3 = i4 = j1 = j2 = j3 = j4 = 0
        
        if (mitad_x < adoq_esp_x):
            if (mitad_y < adoq_esp_y):
                contenido = chr(random.randint(33, 123))
                tablero[mitad_x][mitad_y] = contenido
                tablero[mitad_x + 1][mitad_y] = contenido
                tablero[mitad_x][mitad_y + 1] = contenido
                i1 = i2 = mitad_x
                i3 = j2 = mitad_y + 1
                j1 = j3 = mitad_y
                i4 = adoq_esp_x
                j4 = adoq_esp_y
            else:
                contenido = chr(random.randint(33, 123))
                tablero[mitad_x][mitad_y] = contenido
                tablero[mitad_x + 1][mitad_y + 1] = contenido
                tablero[mitad_x][mitad_y + 1] = contenido
                i1 = i2 = mitad_x
                i4 = mitad_x + 1
                j1 = mitad_y
                j2 = j4 = mitad_y + 1
                i3 = adoq_esp_x
                j3 = adoq_esp_y
        else:
            if (mitad_y < adoq_esp_y):
                contenido = chr(random.randint(33, 123))
                tablero[mitad_x][mitad_y] = contenido
                tablero[mitad_x + 1][mitad_y + 1] = contenido
                tablero[mitad_x + 1][mitad_y] = contenido
                i1 = mitad_x
                i3 = i4 = mitad_x + 1
                j1 = j3 = mitad_y
                j4 = mitad_y + 1
                i2 = adoq_esp_x
                j2 = adoq_esp_y
            else:
                contenido = chr(random.randint(33, 123))
                tablero[mitad_x][mitad_y] = contenido
                tablero[mitad_x + 1][mitad_y + 1] = contenido
                tablero[mitad_x][mitad_y + 1] = contenido
                i1 = i2 = mitad_x
                i3 = mitad_x + 1
                j2 = mitad_y + 1
                j1 = j3 = mitad_y
                i4 = adoq_esp_x
                j4 = adoq_esp_y
        adoquinamiento(tablero, x0, mitad_x, y0, mitad_y, i1, j1)
        adoquinamiento(tablero, x0, mitad_x, mitad_y + 1, y1, i2, j2)
        adoquinamiento(tablero, mitad_x + 1, x1, y0, mitad_y, i3, j3)
        adoquinamiento(tablero, mitad_x + 1, x1, mitad_y + 1, y1, i4, j4)
    
if __name__ == "__main__":
    main()