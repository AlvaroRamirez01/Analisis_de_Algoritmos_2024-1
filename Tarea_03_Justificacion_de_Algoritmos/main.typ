#import "conf.typ": *
#import "@preview/algorithmic:0.1.0"
#import algorithmic: *

#show: doc => conf(
  materia: "Análisis de Algoritmos",
  tarea: "Tarea 03: Justificación de algoritmos",
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

= Problema 1

Considerar los siguientes problemas:

- Problema $alpha$: Calcular el producto de los elementos en el arreglo de números enteros $A[a..b]$.

- Problema $beta$: Calcular la suma de los primeros n múltiplos de 3.

- Problema $gamma$: Calcular la suma de los números impares en el arreglo de números enteros $A[a..b]$.

Elegir *dos* de los problemas anteriores, α o β o γ y ...

+ Proporcionar un algoritmo recursivo (código) que solucione el problema, indicando PreCondiciones y PostCondiciones

+ Demostrar que el algoritmo propuesto es correcto usando inducción matemática.

+ Calcular el tiempo de ejecución del algoritmo dado.

#solucion(color:blue)[
]


= Problema 2
Considera los siguientes problemas:

+ Problema Evaluación de Polinomios.
  
  El Algoritmo Horner evalúa, en el punto x = xo, el polinomio

  $P_n (x)=a_0 + a_1 x + a_2 x^2 + ... + a_n x^n$

+ Problema Búsqueda Binaria. Dado un arreglo de enteros $A[a..b]$, ordenado en forma ascendente, determinar si el elemento x ∈ A e indicar la posición donde se encuentra, si está.

Dados los códigos para los problemas de A y B, mostrados abajo, demostrar usando la Técnica del Invariante del ciclo, que los algoritmos (códigos) son correctos.

`
    Procedure H (A:Array of integers ; x0: Integer)
      var i, total : Integer;
        total ← 0 ;
          for i = n - 1 to 0 by -1 do
            tal ← A[i] + total * x0;
          Return total
    end Horner
`

// #algorithm({
//   import algorithmic: *
//   Function("Binary-Search", args: ("A", "n", "v"), {
//     Cmt[Initialize the search range]
//     Assign[$l$][$1$]
//     Assign[$r$][$n$]
//     State[]
//     While(cond: $l <= r$, {
//       Assign([mid], FnI[floor][$(l + r)/2$])
//       If(cond: $A ["mid"] < v$, {
//         Assign[$l$][$m + 1$]
//       })
//       ElsIf(cond: [$A ["mid"] > v$], {
//         Assign[$r$][$m - 1$]
//       })
//       Else({
//         Return[$m$]
//       })
//     })
//     Return[*null*]
//   })
// })

`
    BinarySearch(var A:Atype; a,b:integer;
                     x:keytype; var pos:integer):boolean
    // PreCondicion: a<=b+1 and A[a]<=...<=A[b]
    var i,j,mid:integer; found: boolean;
    begin
      i=a; j=b; found=false;
      while ( (i!=j+1) and (not found) ) do
        mid=(i+j) div 2;
        if (x = A[mid]) then found=true;
          elseif (x < A[mid]) then j=mid-1;
            else                   i=mid+1;
        end_if;
      end_while;
      if found then pos=mid;
        else pos=j;
      end_if;
      return found;
    end BinarySearch

    // PostC: (found implica: a<=pos<=b and A[pos] = x) and
              (not found implica: a-1 <= pos <= b
                         and (for all k a<=k<=pos, A[k]<x)
                         and (for all f pos+1<=k<=b, x<A[k]))

`
#solucion(color:green)[
  Aquí va la solución.
]

= Problema Opcional.

Para los problemas elegidos en el Ejercicio I

+ Proporcionar un algoritmo iterativo (código) que solucione el problema, indicando PreCondiciones y PostCondiciones

+ Demuestra que el algoritmo es correcto usando la técnica del Invariante del ciclo (loop invariant).

+ Determinar el desempeño computacional del algoritmo dado.

#solucion(color:purple)[
  Aquí va la solución.
]
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
