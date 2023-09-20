#import "conf.typ": *
#import "@preview/algorithmic:0.1.0"
#import algorithmic: *

#show: doc => conf(
  materia: "Análisis de Algoritmos",
  tarea: "Tarea 4: Diseño de Algoritmos usando Inducción Matemática.",
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

#text(12pt)[
#par(justify: true)[
#set enum(numbering: "a)")
= Considera los siguientes Problemas:

*Π: Partición.* Dada una lista $L$ de $n$ enteros positivos y distintos, particionar (dividir)
la lista en dos sublistas $L_1$ y $L_2$, cada una de tamaño $n/2$ tal que: $L= L_1 ∪ L_2; L_1 ∩ L_2 = ∅$;
se satisface, ademas, que la diferencia entre las sumas de los enteros en las dos listas sea
minima. Puedes suponer que n es múltiplo de dos.

*β: Cambio de Base.* Dado un numero en base 8 convertirlo a binario.
La entrada es un arreglo de dígitos en base 8 y la salida es un arreglo de bits.

*∆: Distancias.* Sea $T=(V,A)$ un árbol binario con $n$ vertices. El árbol $T$ esta 
representado por su lista de adyacencias. Construir una matriz $M$ de $n×n$ tal que el elemento
$M[i, j]$ sea igual a la distancia entre los vertices $v_i$ y $v_j$.

== Para el Problema seleccionado...
+ Diseñar un algoritmo eficiente, usando Inducción Matemática, que solucione el problema y que use el menor numero de comparaciones.
+ Determinar la complejidad del algoritmo obtenido.

// #let colors = (black, gray, silver, white, navy, blue, aqua, teal, eastern, purple, fuchsia, maroon, red, orange, yellow, olive, green, lime)
#solucion(color: lime)[
  #lorem(40)
]

= Caja Negra. 
Se tiene acceso a un algoritmo, denominado Caja Negra, del cual solo se conocen sus resultados, contesta: *sí* o *no*.
Si se le da una secuencia de $n$ números enteros y un entero $k$, el algoritmo responde *si* o *no*, dependiendo si existe un subconjunto de esos números cuya suma sea exactamente $k$.

Mostrar como usar esta Caja Negra $O(n)$ veces en un proceso que encuentre el subconjunto en cuestión, si es que existe, donde $n$ es el tamaño de la secuencia.

#solucion(color: blue)[
  #lorem(40)
]

= Opcional: 
Los Dos menores elementos de un Conjunto.

#solucion(color: purple)[
  #lorem(40)
]

*Problema μ:* Dada una secuencia $S = [x_1, x_2, ..., x_n]$ de números enteros, encontrar a los
dos menores elementos de $S$, usando la menor cantidad posible de comparaciones.

+ Diseñar, usando Inducción Matemática, un algoritmo que resuelva el problema $μ$.
+ Determinar el numero de comparaciones que realiza el algoritmo propuesto.
]
]

/*

== Primera pregunta
#lorem(40)
#for c in colors {
  solucion(color: c)[
    Este es el color #c
    #lorem(40)s
  ]
} 
*/
