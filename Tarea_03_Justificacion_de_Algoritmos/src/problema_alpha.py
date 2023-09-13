def producto_elementos(lista):
    if len(lista) == 1:  # Lista con un solo elemento
        return lista[0]
    else:
        return lista[0] * producto_elementos(lista[1:])

# Ejemplo de uso:
lista = [1, 2, 3, 4, 5]
resultado = producto_elementos(lista)
print(resultado)  
# Esto imprimirá el producto de los elementos de la lista: 120
