import sys

def worst_case_quick_sort(n):
    if n <= 0:
        return []

    # Crear una lista ordenada de manera descendente
    worst_case_list = list(range(n, 0, -1))
    
    # Intercambiar el elemento en la posición n div 2 con el primer elemento
    worst_case_list[0], worst_case_list[n // 2] = worst_case_list[n // 2], worst_case_list[0]
    
    return worst_case_list

# Ejemplo de uso
n = int(sys.argv[1])
worst_case_list = worst_case_quick_sort(n)
print("Peor caso para Quick Sort (n = {}):".format(n))
print(worst_case_list)
