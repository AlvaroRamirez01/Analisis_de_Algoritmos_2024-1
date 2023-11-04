def op_sort(arr):
    # Inicializar un arreglo de conteo con 500 elementos (índices 0-499)
    count = [0] * 500

    # Contar la frecuencia de cada elemento en la lista
    for num in arr:
        count[num - 1] += 1

    # Reconstruir la lista ordenada a partir del arreglo de conteo
    sorted_arr = []
    for i in range(500):
        sorted_arr.extend([i + 1] * count[i])

    return sorted_arr

# Ejemplo de uso:
lista = [354, 23, 126, 98, 354, 1, 7, 249, 500, 55]
sorted_lista = op_sort(lista)
print(sorted_lista)
