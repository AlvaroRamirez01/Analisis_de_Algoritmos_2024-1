""" 
Universidad Nacional Autónoma de Mexico
Facultad de Ciencias
Análisis de Algoritmos 2024-1
Practica #2: Búsquedas
Profesor: Maria de Luz Gasca Soto
Ayudante: Rodrigo Fernando Velazquez Cruz
Ayudante: Teresa Becerril Torres
Alumno: Alvaro Ramirez Lopez
N° de cuenta: 316276355 
"""

# biblioteca para generar números aleatorios
import random
# biblioteca para tomar argumentos desde la linea de comandos en ejecución
import sys


""" 
    genera_arreglo(n): Función que genera un arreglo de tamaño n con números aleatorios, 
    para generar dicha arreglo primero se genera un arreglo de tamaño 2n 
    con números aleatorios, donde en este arreglo pueden existir números repetidos,
    posteriormente se convierte el arreglo en un conjunto para eliminar los números repetidos
    y finalmente se ordena el arreglo para cumplir la restricción de 
    |A[i]-A[i+1]| <=1; si A[0] = x, A[n-1] = y entonces x < y
    y se toman los primeros n elementos del arreglo ordenado.
"""
def genera_arreglo(n):
    """ revisamos que el tamaño del arreglo sea mayor a 0 ya que debe de tener 
    por lo menos un elemento """
    if n <= 0:
        print("El numero de elementos del arreglo debe ser mayor a 0")
        exit()
    i=n
    # generamos un arreglo de tamaño 2n con números aleatorios por si existen números repetidos.
    arreglo = [random.randint(1, n*2) for _ in range(n*2)]
    # eliminamos los elementos repetidos del arreglo
    arreglo = list(set(arreglo))
    # ordenamos el arreglo
    arreglo.sort()
    # generamos el arreglo del tamaño solicitado {n}
    arreglo = arreglo[:i]
    print(f'''\nEste es el arreglo generado:\n {arreglo}''')
    return arreglo


""" 
    busqueda(arreglo, z): Función que realiza la búsqueda de un elemento z en 
    un arreglo ordenado, para realizar la búsqueda se utiliza el algoritmo de 
    búsqueda binaria, en caso de no encontrar el elemento z en el arreglo se 
    imprime un mensaje indicando que el elemento no se encuentra en el arreglo.
"""
def busqueda(arreglo, z):
    x, y = 0, len(arreglo)-1
    
    while x <= y:
        medio = (x+y)//2
        if arreglo[medio] == z:
            print(f'''\nEl elemento {z} se encuentra en la posición {medio+1}''')
            return
        elif arreglo[medio] < z:
            x = medio + 1
            print(f'''\nEstamos buscando en el lado derecho\nVamos a buscar el elemento en este subarreglo:\n{arreglo[medio+1:y+1]}''')
        else:
            y = medio - 1
            print(f'''\nEstamos buscando en el lado izquierdo\nVamos a buscar el elemento en este subarreglo:\n{arreglo[x:y+1]}''')
    print(f'''\nEl elemento {z} no se encuentra en el arreglo''')

"""
    main(): Función principal que toma como argumento desde el sistema el tamaño 
    del arreglo a generar y después con la función genera_arreglo(n) se genera
    el arreglo del tamaño solicitado, posteriormente se genera un número 
    aleatorio z del rango de 1 hasta el tamaño del arreglo y se realiza la 
    búsqueda del elemento z en el arreglo generado.
"""
def main():
    # tomamos el tamaño del arreglo desde la linea de comandos
    n = int(sys.argv[1])
    # generamos el arreglo del tamaño solicitado
    arreglo = genera_arreglo(n)
    # generamos un número aleatorio z del rango de 1 hasta el tamaño del arreglo
    z = random.randint(1, len(arreglo)-1)
    print(f'''\nVamos a buscar el elemento {z} en el arreglo''')
    busqueda(arreglo, z)

if __name__ == "__main__":
    main()
    
