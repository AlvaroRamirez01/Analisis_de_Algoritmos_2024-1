<br>
<table>
  <tr>
    <td><img src="images/unam.png" alt="Logo Universidad" width="142"/></td>
    <td style="text-align: center;">
    UNIVERSIDAD NACIONAL AUTÓNOMA DE MÉXICO <br>
      FACULTAD DE CIENCIAS<br>
      ANÁLISIS DE ALGORITMOS 
    </td>
    <td><img src="images/ciencias.png" alt="Logo Universidad" width="142"></  <td style="text-align: center;">
  </tr>
</table>

## Práctica 1. Problema de adoquinamiento

- **Alumno:** Alvaro Ramírez López
- **Profesores**:

  - **Titular**: María De Luz Gasca Soto
  - **Ayudantes**:
    - Rodrigo Fernando Velázquez Cruz
    - Teresa Becerril Torres

## Ejecución del programa

En la carpeta src esta un archivo que se llama *main.py*, este programa se deberá de ejecutar con python 3 y como único argumento se le deberá pasar el numero entero positivo el cual es el tamaño de la cuadricula a adoquinar. Cabe destacar que el adoquín inicial se coloca de manera aleatoria por el programa.

A continuación un ejemplo que como se debería ejecutar el programa

```bash
python main.py 8
```

En mi caso, como tengo una única version de python, mi sistema reconoce a python como la instrucción para python 3, pero si se tiene una version instalada de python 2 y de python 3, solo deberán ejecutar la version de python 3 (3.9.13 en adelante), un ejemplo seria el siguiente:

```bash
python3 main.py 8
```

El programa una vez adoquinado la matriz solicitada la va a imprimir, para marcar el relleno de cada adoquín se usaron caracteres aleatorios pero que siguieran el patron de "L" especificado en los requerimientos de la practica.

## Representación de la solución

Para solucionar el problema de adoquinamiento me base en la recursion y en la técnica de "divide y vencerás" que nos presento la profesora, básicamente es primero colocar tu adoquín en algún lugar aleatorio de la matriz, luego verificas en que cuadrante esta el adoquín especial, y rellenas los adoquines que están en sus cuadrantes restantes, después haces recursion sobre cada uno de los 4 cuadrantes los cuales equivalen a la mitad de la longitud de la matriz y se vuelve a buscar el adoquín especial. Este proceso se vuelve a repetir hasta que llegamos al caso base y ahi se rellenan los adoquines vacíos con algún carácter que haga la forma de "L".

En cuestión de imprimir la matriz, el programa lo hace en automático y también se imprime el adoquín especial inicial, asi como su ubicación.
