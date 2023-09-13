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

*Problema $alpha$*

+ Proporcionar un algoritmo recursivo (código) que solucione el problema, indicando PreCondiciones y PostCondiciones

*Precondicion:* El arreglo no debe ser null y debe tener al menos un elemento.

```haskell
productoElementos :: [Int] -> Int
productoElementos [x] = x
productoElementos (x:xs) = x * productoElementos xs
```

*Postcondicion:* El resultado es el producto de todos los elementos del arreglo, el arreglo sigue siendo no null.

+ Demostrar que el algoritmo propuesto es correcto usando inducción matemática.

*Demostración:*

*Por Demostrar:* La función productoElementos devuelve el producto de todos los elementos de la lista $x\s$ para cualquier lista no vacía $x\s$.

*Caso base:* Cuando $x\s$ es una lista con un solo elemento.

En este caso, al ser un único elemento, por vacuidad se cumple que el producto de todos los elementos de la lista es el elemento mismo, entonces se regresa el elemento.

*Hipótesis de inducción:* Supongamos que la función productoElementos devuelve el producto de todos los elementos de la lista $x\s$ de longitud k.

*Paso inductivo:* Ahora demostraremos que la función productoElementos devuelve el producto de todos los elementos de la lista $y\s$ de longitud k+1.

La función productoElementos ys podemos verla como una función que tiene un arreglo de tamaño $k+1$ y se representa de la siguiente forma $[y_1, y_2, y_3, ...,y_k,y_(k+1)]$, asi mismo, podemos expresarla de la siguiente forma $[y_1, y_2, y_3, ...,y_k] ++ [y_(k+1)]$.

Una vez expresada de esta forma, podemos ver que la función productoElementos $[y_1, y_2, y_3, ...,y_k]$ es equivalente a la función productoElementos $x\s$ de longitud k, por lo que podemos aplicar la hipótesis de inducción y sabemos que la función productoElementos $[y_1, y_2, y_3, ...,y_k]$ devuelve el producto de todos los elementos de la lista $y\s$ de longitud k.

Nos queda el otro extremo donde esta el elemento $y_(k+1)$, cuando se le pasa como argumento a la funcion _productoElementos [$y_(k+1)$]_ podemos ver que se le esta pasando un unico elemento, entonces caen en nuestro caso base y esto nos devuelve el mismo elemento.

Entonces podemos multiplicar los resultados generados por las funciones _productoElementos [$y_(k+1)$]_ y _productoElementos [$y_1, y_2, y_3, ...,y_k]$_ y obtenemos el producto de todos los elementos de la lista $y\s$ de longitud k+1, los cuales se expresarian de la siguiente forma. 

#align(center)[
  productoElementos $y\s = (y_1 * y_2 * ... * y_k) * y_(k+1)$
]

Por lo tanto, hemos demostrado por inducción matemática que el código es correcto, ya que cumple con la hipótesis inductiva para todas las listas no vacías.

+ Calcular el tiempo de ejecución del algoritmo dado.

El tiempo de ejecución del código que calcula el producto de todos los elementos de una lista utilizando recursion depende de la longitud de la lista. En este caso, la función _productoElementos_ se implementa de manera recursiva, y la cantidad de operaciones realizadas es directamente proporcional al tamaño de la lista. Cada llamada recursiva reduce la longitud de la lista en 1.

Por lo tanto, si tienes una lista de longitud $n$, la función realizará $n - 1$ llamadas recursivas. Cada llamada implica una multiplicación y una operación de acceso a la lista, lo que significa que en total se realizarán aproximadamente $2 * (n - 1)$ operaciones aritméticas y de acceso a la lista.

Entonces, la complejidad de tiempo para este código es $O(n)$, donde $n$ es la longitud de la lista. Esto significa que el tiempo de ejecución aumenta linealmente con el tamaño de la lista.

*Problema $beta$*

+ Proporcionar un algoritmo recursivo (código) que solucione el problema, indicando PreCondiciones y PostCondiciones

```haskell
sumaPrimerosN :: Int -> Int
sumaPrimerosN 0 = 0
sumaPrimerosN n
    | mod n 3 == 0 = n + sumaPrimerosN (n - 1)
    | otherwise = sumaPrimerosN (n - 1)
```

+ Demostrar que el algoritmo propuesto es correcto usando inducción matemática.

+ Calcular el tiempo de ejecución del algoritmo dado.




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

#algorithm({
  import algorithmic: *
  Function("Binary-Search", args: ("A", "n", "v"), {
    Cmt[Initialize the search range]
    Assign[$l$][$1$]
    Assign[$r$][$n$]
    State[]
    While(cond: $l <= r$, {
      Assign([mid], FnI[floor][$(l + r)/2$])
      If(cond: $A ["mid"] < v$, {
        Assign[$l$][$m + 1$]
      })
      ElsIf(cond: [$A ["mid"] > v$], {
        Assign[$r$][$m - 1$]
      })
      Else({
        Return[$m$]
      })
    })
    Return[*null*]
  })
})

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
