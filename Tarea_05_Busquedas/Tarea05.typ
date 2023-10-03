#import "conf.typ": *
#import "@preview/algorithmic:0.1.0"
#import algorithmic: *

#show: doc => conf(
  materia: "Análisis de Algoritmos",
  tarea: "Tarea 5: Búsquedas.",
  profesor: (
    nombre: "María de Luz Gasca Soto",
    sexo: "F",
  ),
  ayudantes: (
    "Rodrigo Fernando Velázquez Cruz",
    "Teresa Becerril Torres"
  ),
  alumnos: (
    (
      nombre: "Alvaro Ramirez Lopez",
      cuenta: "316276355",
      email: "alvaro@ciencias.unam.mx"
    ),
  ),
  fecha: datetime.today(),
  encabezado: "Problema a desarrollar",
  doc,
)

#let colors = (black, gray, silver, white, navy, blue, aqua, teal, eastern, purple, fuchsia, maroon, red, orange, yellow, olive, green, lime)

#text(11pt)[
#par(justify: true)[
#set enum(numbering: "a)")
= Problema 1
Consideremos el siguiente juego, entre dos personas:
El jugador $J_A$ piensa un número entero en un rango. El jugador $J_B$ intenta encontrar tal número haciendo preguntas de la forma:

¿Es el número menor que $x$? o ¿Es mayor que $y$?

El objetivo es realizar el menor número de preguntas.
Se supone que nadie hace trampa.

+ Diseñar una buena estrategia para el juego... cuando el jugador $J_A$ indica un rango especifico, digamos de $1$ a $N$. En este caso, ¿Cual resulta ser la complejidad del algoritmo? *Justificar*.
+ Diseñar una buena estrategia para el juego... cuando el jugador $J_A$ no indica el rango del número que pensó. ¿Cual es la complejidad del algoritmo propuesto? *Justificar*.

= Problema 2
Dada un arreglo de n enteros $A[0,...,n-1]$, tal que $∀i$, $0≤i≤n$, se tiene que $|A[i]-A[i+1]|≤1$; si $A[0]=x$ y $A[n-1]=y$, se tiene que $x < y$.

Diseña un algoritmo de búsqueda eficiente, de orden logarítmico, que localice al indice $j$ tal que $a[j] = z$, para un valor dado de $z$, $x ≤ z ≤ y$. *Justificar.*

= Problema 3 
Se tiene un conjunto de $N$ rocas, todas ellas de diferente tamaño, forma y consistencia. Rocas que se ven del mismo tamaño pueden tener peso muy diferente.

Un Experto desea convencer a un Jurado que una roca especial, de entre las N rocas dadas, es la de menor peso. El Experto si sabe los pesos de cada una de las rocas y el Jurado no. El Experto quiere
mostrar que la roca especial es la de menor peso usando una balanza menos de $(N-1)$ veces. ¿Eso es posible? *Justifica.*

= Problema 4
Consideremos el Algoritmo de Búsqueda por Interpolación.

+ Presentar un ejemplo de al menos 400 datos para el cual el algoritmo termine la búsqueda (exitosa o no) en pocas iteraciones.

+ Dar un ejemplo de, al menos, 400 datos para el cual el algoritmo termine la búsqueda (exitosa o no) en muchas iteraciones.

= Problema Opcional
Supongamos que se tiene un programa que manipula textos muy grandes, como un procesador de palabras. El programa toma como entrada un texto, representado como una secuencia de caracteres y produce alguna salida.

Si en algún momento el programa encuentra un error del cual no puede recuperarse y ademas no puede indicar que error es o donde esta, entonces la única acción que el programa toma es escribir ERROR y abortar el proceso.

Supongamos que el error es local, esto es, se tiene una cadena en particular del texto la cual, por alguna extraña razón, al programa no le gusta. El error es independiente del contexto en el cual aparece la cadena “ofensiva”. Diseñar una estrategia logarítmica para localizar la fuente del error.

]]