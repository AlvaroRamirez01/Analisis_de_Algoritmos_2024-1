#import "conf.typ": *

#show: doc => conf(
  materia: "Análisis de Algoritmos",
  tarea: "Tarea 01: Problemas y Algoritmos",
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
= Problema a desarrollar
Francisco necesita comprar clavos para un proyecto personal, le recomendaron que si los compraba en la tienda de _The Home Depot_ podría encontrar el clavo adecuado a su proyecto. Llegando a la tienda, fue a la sección de construcción y encontró una máquina que dispensa clavos, para que la maquina le dé el clavo que quiere solo debe especificar ciertas cosas como lo es:  

- Tipo de cabeza (ovalada o sin cabeza, ancha, plana)
- Diámetro del clavo (expresado en pulgadas o milímetros)
- Longitud del clavo (expresado en pulgadas o milímetros)
- Acabado del clavo (acero, acero inoxidable, cobre y latón)

Francisco necesita clavos de cabeza plana, de 3 milímetros de diámetro, 50 milímetros de longitud y de acero inoxidable.

= Datos de entrada
+ Una maquina despachadora de clavos $M$
+ Tipo de cabeza de clavo $T$
+ Diámetro de clavo $D$
+ Longitud de clavo $L$
+ Acabado del clavo $A$

== Pre-condición
La máquina $S$ es finita.

Los datos $T,D,L,A$ no nulos.

= Proceso
+ La máquina $M$ recibe los datos $T,D,L,A$ que ingresa la persona
+ $M$ se conecta a su base de datos a la que llamamos $B\D$
+ Si $B\D$ tiene en existencia un clavo de características $T,D,L,A$ entonces:

- Expulsamos un clavo de características $T,D,L,A$ y en $B\D$ descontamos los artículos que fueron despachados.
- En otro caso, informamos al usuario que no contamos con el clavo que solicito.
4. Vuelve a la pantalla principal.

== Post-condición
$M$ sigue siendo finita y dependiendo de su $B\D$ puede ser no vacia o vacía si es que se le acabo su inventario de clavos 

= Datos de salida
Se obtiene el clavo de acuerdo a las características que se dio a la maquina o se obtiene un mensaje diciendo que no se cuenta con el articulo disponible.

]]

/* == Primera pregunta
#lorem(40)
#for c in colors {
  solucion(color: c)[
    #lorem(40)
  ]
} 

#pagebreak()

== Segunda pregunta
#lorem(40) @Typst

*/