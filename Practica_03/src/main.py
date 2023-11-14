""" 
Universidad Nacional Autónoma de Mexico
Facultad de Ciencias
Análisis de Algoritmos 2024-1
Practica #3: Ordenamientos
Profesor: Maria de Luz Gasca Soto
Ayudante: Rodrigo Fernando Velazquez Cruz
Ayudante: Teresa Becerril Torres
Alumno: Alvaro Ramirez Lopez
N° de cuenta: 316276355 
"""

import sys
import timeit

""" 
genera_k_zig_zag(n, k): Función que genera una secuencia k-zig-zag de tamaño n, 
con un k dado, dicho k define como sera el zig-zag, por ejemplo si k=3 entonces
se hará intercalando 3 elementos mayores y menores.
"""
def genera_k_zig_zag(n, k):
    # Genera una lista de n elementos
    lista = [_ for _ in range(1, n+1)]
    # divide la lista en 2 sublistas de tamaño len(lista)/2
    sublista1 = lista[:len(lista)//2]
    # invertimos la sublista1
    sublista1 = sublista1[::-1]
    # divide la lista en 2 sublistas de tamaño len(lista)/2
    sublista2 = lista[len(lista)//2:]
    # en esta lista se guardaran los elementos generados por el zig-zag
    lista_k_zig_zag = []
    # bucle que se ejecuta mientras las sublistas tengan los k elementos
    while (len(sublista1) > k and len(sublista2) > k):
        # tomamos los k elementos de la sublista2 y los insertamos en la lista_k_zig_zag
        lista_k_zig_zag.extend(sublista2[:k])
        # eliminamos los k elementos de la sublista2 ya insertados de la original
        del sublista2[:k]
        # tomamos los k elementos de la sublista1 y los insertamos en la lista_k_zig_zag
        lista_k_zig_zag.extend(sublista1[:k])
        # eliminamos los k elementos de la sublista1 ya insertados de la original
        del sublista1[:k]
    # terminamos de insertar los elementos de las sublistas en la lista_k_zig_zag
    lista_k_zig_zag.extend(sublista2)
    lista_k_zig_zag.extend(sublista1)
    return lista_k_zig_zag

""" 
insertion_sort(lista): Función que ordena una lista de elementos utilizando el
algoritmo de ordenamiento insertion sort.
"""
def insertion_sort(lista):
    # recorremos la lista desde el segundo elemento hasta el último
    for i in range(1, len(lista)):
        # guardamos el elemento en la posición i
        elemento = lista[i]
        # guardamos la posición del elemento anterior
        j = i-1
        # mientras que el elemento anterior sea mayor al elemento en la posición i
        # y la posición sea mayor o igual a 0
        while j >= 0 and lista[j] > elemento:
            # intercambiamos los elementos
            lista[j+1] = lista[j]
            # Decrementamos la posición
            j -= 1
        # insertamos el elemento en la posición j+1
        lista[j+1] = elemento
        print(f'''Iteración {i}, Estado de la lista: {lista}, Elemento insertado: {elemento}''')
    return lista
""" 
local_insertion_sort(lista, indice): Función que ordena una lista de elementos
usando el algoritmo de ordenamiento insertion sort con una modificación, en este
se basa en un indice que indica el ultimo elemento que se inserto, para asi hacer
la inserción de los elementos de manera local y no recorrer toda la lista.
"""
def local_insertion_sort(l1, l2, i):
    # definimos la lista a ordenar, la lista ordenada y el indice del ultimo elemento insertado
    lista_a_ordenar = l1
    lista_ordenada = l2
    ue_insertado = i
    # este sera nuestro caso inicial, cuando la lista ordenada esta vacia y el 
    # ultimo indice es la cabeza de la lista a ordenar
    if lista_ordenada == []:
        print(f'''\nEstado de la lista: {lista_ordenada}, Elemento a insertar: {lista_a_ordenar[ue_insertado]}, Ultimo indice: {ue_insertado}''')
        lista_ordenada.append(lista_a_ordenar[ue_insertado])
        lista_a_ordenar.pop(ue_insertado)
        return local_insertion_sort(lista_a_ordenar, lista_ordenada,ue_insertado)
    # aquí es donde la lista ya tiene una referencia de donde esta el ultimo elemento insertado
    while not lista_a_ordenar == []:
        # tomamos el elemento a insertar de la lista desordenada
        elemento_a_insertar = lista_a_ordenar[0]
        # eliminamos el elemento de la lista desordenada
        lista_a_ordenar.pop(0)
        # si el elemento a insertar es menor al ultimo elemento insertado, entonces se inserta a la izquierda
        if elemento_a_insertar < lista_ordenada[ue_insertado]:
            print(f'''Estado de la lista: {lista_ordenada}, Elemento a insertar: {elemento_a_insertar}, Ultimo indice: {ue_insertado}''')
            lista_ordenada, ue_insertado = inserta_a_la_izquierda(lista_ordenada, elemento_a_insertar, ue_insertado)
        # si el elemento a insertar es mayor al ultimo elemento insertado, entonces se inserta a la derecha
        if elemento_a_insertar > lista_ordenada[ue_insertado]:
            print(f'''Estado de la lista: {lista_ordenada}, Elemento a insertar: {elemento_a_insertar}, Ultimo indice: {ue_insertado}''')
            lista_ordenada, ue_insertado = inserta_a_la_derecha(lista_ordenada, elemento_a_insertar, ue_insertado)
    return lista_ordenada

""" 
inserta_a_la_izquierda(lista, elemento, indice): Función que inserta un elemento
en una lista de manera que el elemento quede a la izquierda del indice, y regresa
la lista, el elemento y el indice.
"""
def inserta_a_la_izquierda(lista, elemento, indice):
    for i in range (0, len(lista)):
        if elemento < lista[i]:
            lista.insert(i, elemento)
            break
    indice = lista.index(elemento)
    return lista, indice

""" 
inserta_a_la_derecha(lista, elemento, indice): Función que inserta un elemento
en una lista de manera que el elemento quede a la derecha del indice, y regresa
la lista, el elemento y el indice."""
def inserta_a_la_derecha(lista, elemento, indice):
    for i in range (0, len(lista)):
        if elemento > lista[i]:
            lista.append(elemento)
            break
    indice = lista.index(elemento)
    return lista, indice

""" 
main(): Función principal que toma los argumentos desde la linea de comandos
en ejecución, el primer argumento es el tamaño de la secuencia y el segundo
argumento es el k que define como sera el zig-zag.
"""
def main():
    # tomamos desde la linea de comandos el tamaño de la secuencia n
    n = int(sys.argv[1])
    # igual tomamos el valor de k desde la linea de comandos
    k = int(sys.argv[2])
    if n < 1 and k < 1:
        print("El valor de n y k deben ser mayor a 0")
        exit()
    print(f'''{'-' * 80}\nPractica #3: Ordenamientos\n{'-' * 80}\n''')
    print(f'''Se generara una secuencia {k}-zig-zag de tamaño {n}''')
    lista = genera_k_zig_zag(n, k)
    print(f'''Esta es la secuencia {k}-zig-zag generada:\n{lista}''')
    print(f'''\n{'-' * 80}\nEjecución de algoritmo insertion sort\n''')
    lista_ordenada = insertion_sort(lista)
    print(f'''\nEsta es la lista ordenada por el algoritmo insertion sort:\n{lista_ordenada}\n{'-' * 80}\n''')
    print(f'''\n{'-' * 80}\nEjecución de algoritmo local insertion sort\n''')
    lista2_ordenada = local_insertion_sort(lista, [], 0)
    print(f'''\nEsta es la lista ordenada por el algoritmo local insertion sort:\n{lista2_ordenada}\n{'-' * 80}\n''')

if __name__ == "__main__":
    main()
