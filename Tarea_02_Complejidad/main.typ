#import "conf.typ": *

#show: doc => conf(
  materia: "Análisis de Algoritmos",
  tarea: "Tarea 02: Complejidad",
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
= Problema 1
Sea $Pi$ un problema. El desempeño computacional en el peor de los casos para $Pi$ es $O(n^2)$ y también es $Omega(n log_2 n)$.

Sea $A$ un algoritmo que soluciona $Pi$. ¿Cuales de las siguientes afirmaciones resultan consistentes con la información sobre $Pi$?

*Justifique su respuesta*

#set enum(numbering: "a)")

+ $A$ tiene en el peor caso complejidad $O(n^3)$.
+ $A$ tiene en el peor caso complejidad $O(n)$.
+ $A$ tiene en el peor caso complejidad $Theta(n log n)$.
+ $A$ tiene en el peor caso complejidad $Theta(n^2)$.

#solucion(color:black)[
  + $A$ tiene en el peor caso complejidad $O(n^3)$.

  Esto es cierto, porque el peor caso descrito por el problema es $O(n^2)$, y se sabe que $n^2 in O(n^3)$

  #align(center)[
    $forall n >= 1 | n^2 <= 1 dot n^3$
  ]

  + $A$ tiene en el peor caso complejidad $O(n)$.

  Esto es falso, porque el peor caso descrito por el problema es $O(n^2)$, y como O es una cota superior, $n$ no esta en $O(n^2)$.

  #align(center)[
    $forall n >= 1 | n <= n^2$
  ]
  
  + $A$ tiene en el peor caso complejidad $Theta(n log n)$.

  Esto es falso, porque el peor caso descrito por el problema es $O(n^2)$, y como $O$ es una cota superior, $n log n$ no esta en $O(n^2)$, aunque se cumpla que $n log n$ si pertenece a la cota inferior de $Omega(n log_2 n)$.

  #align(center)[
    $Theta(n log n) = cancel(O(n log n)) sect Omega(n log n)$
  ]
  
  + $A$ tiene en el peor caso complejidad $Theta(n^2)$.

  Igual esto es falso, dado a que se cumple que $n^2 in O(n^2)$, pero no se cumple que $n^2 in Omega(n log_2 n)$.

  #align(center)[
    $Theta(n^2) = O(n^2) sect cancel(Omega(n log n))$
  ]
  ]

= Problema 2
Supongamos que un algoritmo $A$ se ejecuta en el peor de los casos con
tiempo $f(n)$ y el algoritmo $B$ toma tiempo $g(n)$, en el peor caso.

Responda las siguientes preguntas con *si, no* o *tal vez* y *justifica
formalmente tu respuesta.*

¿Es $B$ mas rápido que $A$, para toda $n$ mayor que alguna $n_0$ ...

+ ... si $g(n) in Omega(f(n) log n)$ ? 
+ ... si $g(n) in Theta(f(n) log n)$ ?

#solucion(color:lime)[
  + *¿Es $B$ mas rápido que $A$, para toda $n$ mayor que alguna $n_0$ si $g(n) in Omega(f(n) log n)$?* 
  Sí, $B$ es más rápido que $A$ para toda $n$ mayor que alguna $n_0$ si $g(n) in Omega(f(n) log n)$.

*Justificación:*

Según la notación asintótica, $g(n) in Omega(f(n) log n)$ implica que $g(n)$ crece al menos tan rápido como $f(n) log n$ para valores suficientemente grandes de $n$.

Si $g(n) in Omega(f(n) log n)$, significa que existe una constante positiva $c$ y un valor $n_1$ tal que para todos los $n$ mayores que $n_1$, se cumple que $g(n) >= c dot f(n) log n$.

Ahora, si consideramos $n$ mayor que $n_1$, podemos comparar los tiempos de ejecución en el peor caso:

- Para el algoritmo $A$: $T_A(n) <= f(n)$

- Para el algoritmo $B$: $T_B(n) <= g(n)$

Usando la relación de $g(n) >= c dot f(n) log n$, podemos escribir:

#align(center)[
  $g(n) >= c dot f(n) log n$

  $=> T_B (n) <= c dot f(n)log n$

  $=> T_B (n) <= f(n) dot (c dot log n)$
]

Dado que $c dot log n$ crece más lentamente que $f(n)$, para valores suficientemente grandes de $n$, $B$ será más rápido que $A$.

En resumen, si $g(n) in Omega(f(n) log n)$ y si $n$ es mayor que algún valor $n_0$ (que podría ser el máximo entre $n_1$ y otro valor), entonces $B$ será más rápido que $A$ para esos valores de $n$.

  b) *¿Es $B$ mas rápido que $A$, para toda $n$ mayor que alguna $n_0$ si $g(n) in Theta(f(n) log n)$?*

  Sí, $B$ es más rápido que $A$ para toda $n$ mayor que alguna $n_0$ si $g(n) in Theta(f(n) log n)$.

Justificación:

Cuando $g(n) in Theta(f(n) log n)$, esto implica que hay dos constantes positivas $c_1$ y $c_2$ tales que para valores suficientemente grandes de $n$, se cumple:

#align(center)[
  $c_1 dot f(n) log n <= g(n) <= c_2 dot f(n) log n$
]

Ahora, para comparar los tiempos de ejecución en el peor caso de los algoritmos $A$ y $B$:

Algoritmo $A$: $T_A(n) <= f(n)$
Algoritmo $B$: $T_B(n) <= g(n)$
Usando la relación $c_1 dot f(n) log n <= g(n)$, podemos escribir:

#align(center)[
  $T_B (n) <= c_2 dot f(n) log n$
]

Dado que $c_2 dot f(n) log n$ crece más lentamente que $f(n)$, para valores suficientemente grandes de $n$, $B$ será más rápido que $A$.

En resumen, si $g(n) in Theta(f(n) log n)$ y si $n$ es mayor que algún valor $n_0$ (que podría ser el valor donde la desigualdad de las constantes $c_1$ y $c_2$ comienza a mantenerse), entonces $B$ será más rápido que $A$ para esos valores de $n$.
  ]

= Problema 3

Considera los siguientes ciclos anidados:
	`
    ...
      i <-- n;
      while i > 0 do
      j <-- i;
      while not (j > n)
      <cuerpo del repeat> // requiere O(1)
      j <-- j * 2
      end_w
      i <-- i / 2
      end_w
    ...
  `

+ Determina el desempeño computacional $T(n)$ de los ciclos anidados.
+ Si en el código anterior cambiamos la asignación
    
    $i ← i/2$ por $i ← i$ div $2$

¿Cual seria el desempeño computacional $T(n)$ del proceso? *Justifica*

Para facilitar las operaciones aritméticas, en ambos incisos, puedes
suponer que $n$ es potencia de 2.

#solucion(color:blue)[
  *a) Determina el desempeño computacional $T(n)$ de los ciclos anidados.*

  Dado que podemos suponer que n es una potencia de 2, la relación entre i y n será i = n. Además, sabemos que en cada iteración del bucle exterior (while i > 0), i se divide por 2 y j se duplica en cada iteración del bucle interno (while not (j > n)). Esto significa que ambos bucles se ejecutarán log_2(n) veces.

  Dentro del bucle interno, el "cuerpo del repeat" requiere O(1) operaciones, lo que significa que su tiempo de ejecución es  constante, independientemente del valor de n o i.

  Entonces, el tiempo total de ejecución del código se puede calcular como el producto del número de iteraciones de ambos   bucles y el tiempo de ejecución del "cuerpo del repeat" en cada iteración:

  Tiempo total = $log_2(n) dot log_2(n) dot O(1) = O(log^2(n))$

  Por lo tanto, el desempeño computacional de este pseudocódigo es O(log^2(n)), lo que significa que el tiempo de ejecución   aumenta de manera cuadrática en relación con el logaritmo de n.
  
  *b) Si cambiamos la asignación de $i ← i/2$ por $i ← i$ div $2$, ¿Cual seria el desempeño computacional $T(n)$ del proceso? *

  T(n) seguiría siendo el mismo, si reemplazamos la asignación i = i/2 por i = i div 2, donde div representa la división entera (es decir, una división que redondea hacia abajo al número entero más cercano), el desempeño computacional del proceso se mantiene esencialmente igual, ya que la cantidad de iteraciones no cambia y el "cuerpo del repeat" sigue ejecutándose O(1) veces en cada iteración.

  Dado que los bucles exteriores e interiores todavía se ejecutan log_2(n) veces cada uno, y el "cuerpo del repeat" sigue   requiriendo O(1) operaciones en cada iteración, el tiempo total de ejecución seguirá siendo:

  $T(n) = log_2(n) * log_2(n) * O(1) = O(log^2(n))$

  Por lo tanto, el desempeño computacional del proceso no cambia, sigue siendo O(log^2(n)) incluso con la asignación modificada.
  ]

= Problema 4

Proporciona un algoritmo (código) cuyo desempeño computacional sea
$Theta(n^3 log n)$. Debes usar operaciones básicas, *no* debes usar procesos.

*Justifica* formalmente que tu algoritmo alcanza el tiempo pedido.

#solucion(color:navy)[
  `
    ...
      i <-- n;
      j <-- n;
      k <-- n;
      t <-- 9;
      arr[] <-- length(arr)=10;
      while i > 0 do
        while j > 0 do
          while k > 0 do
            arr[t] <-- t mod 2;
            t <-- t div 2;
          end_w
          j <-- j / 2
        end_w
        i <-- i / 2
      end_w
    ...
  `

  *Justificación*

  El algoritmo descrito anteriormente tiene un tiempo de ejecución en el peor caso de $T(n) = Theta(n^3 log n)$. Para que esto sea cierto, se debe cumplir que: T(n) pertenece a $O(n^3 log n) sect Omega(n^3 log n)$.

  *Primero vamos a tratar el caso para $O(n^3 log n)$:*

  Aquí tenemos 3 ciclos while que van desde $n$ hasta $1$, y en cada uno de ellos se realizan operaciones de tiempo constante. Por lo tanto, el tiempo de ejecución en el peor caso es de tiempo $O(n^3)$.

  Ahora, en la parte mas interna del ciclo while, se realiza una operación que divide a la mitad el valor de $t$ en cada iteración. Esto significa que la operación interna que hace el arreglo se ejecutará $log n$ veces. Por lo tanto, el tiempo de ejecución en el peor caso es de tiempo $O(log n)$ solo para esa parte del código.

  Por lo tanto,  si tomamos el tiempo de ejecución de los ciclos while con el tiempo de ejecución del arreglo nos dice que el algoritmo si pertenece a $O(n^3 log n)$.

  *Ahora vamos a tratar el caso para $Omega(n^3 log n)$:*

  Aquí tenemos 3 ciclos while que van desde $n$ hasta $1$ como lo vimos anteriormente, entonces podemos determinar que el tiempo de ejecución pertenece a $Omega(n^3)$, ya que por lo menos toma $n^3$ de tiempo de ejecución.

  Ahora, en la parte mas interna del ciclo while, se realiza una operación que divide a la mitad el valor de $t$ en cada iteración. Para que pertenezca a $Omega(log n)$ el tiempo de ejecución del arreglo debe ser mayor o igual a $log n$, entonces si pertenece a $Omega(log n)$ y por lo tanto pertenece $Omega(n^3 log n)$.
  
  Como podemos observar, el algoritmo cumple con las condiciones para pertenecer a $O(n^3 log n)$ y $Omega(n^3 log n)$, por lo tanto, el algoritmo pertenece a $Theta(n^3 log n)$.
  ]

= Problema 5
Considera las siguientes funciones de complejidad:

$n^2 log 3^n$ 

$n^2.75$

$3^2·n!$

$n^2 / (log n)$

$(3n^2-2n + 8)^4$

$(7n - 1)!$

$4^n$

$2^(2n) · n^(2n)$ 

$n^(log n)$

$6n^3 - 3n^2 + 2^(n+2)$

Usando la definición formal de $O, Ω, Θ, o$ y $ω$ asi como las relaciones estar contenido, $⊂$, y ser igual, $=$, *ordenar* las funciones de complejidad dadas en términos de $O, Θ$ y $Ω$.

#solucion(color:teal)[
  *Funciones ordenadas en términos de $0(f(n))$, es de la forma $g(n) <= c dot f(n)$*

  Las funciones que pertenecen a $O(n^(log n))$ son:

  $n^(log n)$

  Las funciones que pertenecen a $O(n)$ son:

  $n^(log n)$

  $4^n$

  $2^(2n) · n^(2n)$ 

  Las funciones que pertenecen a $O(n^2)$ son:

  $n^(log n)$

  $4^n$

  $2^(2n) · n^(2n)$ 

  $n^2 log 3^n$ 

  $n^2.75$

  $n^2 / (log n)$

  Las funciones que pertenecen a $O(n^3)$ son:

  $n^(log n)$

  $4^n$

  $2^(2n) · n^(2n)$ 

  $n^2 log 3^n$ 

  $n^2.75$

  $n^2 / (log n)$
  
  $6n^3 - 3n^2 + 2^(n+2)$

  Las funciones que pertenecen a $O(n^8)$ son:

  $n^(log n)$

  $4^n$

  $2^(2n) · n^(2n)$ 

  $n^2 log 3^n$ 

  $n^2.75$

  $n^2 / (log n)$
  
  $6n^3 - 3n^2 + 2^(n+2)$

  $(3n^2-2n + 8)^4$

  Las funciones que pertenecen a $O(n!)$ son:

  $n^(log n)$

  $4^n$

  $2^(2n) · n^(2n)$ 

  $n^2 log 3^n$ 

  $n^2.75$

  $n^2 / (log n)$
  
  $6n^3 - 3n^2 + 2^(n+2)$

  $(3n^2-2n + 8)^4$

  $3^2·n!$

  $(7n - 1)!$

  Estas funciones están contenidas de la siguiente forma 
  
  $O(n^(log^n)) subset O(n) subset O(n^2) subset O(n^3) subset O(n^8) subset O(n!)$.

  *Funciones ordenadas en términos de $Omega$, es de la forma $g(n) >= c dot f(n)$*

  Las funciones que pertenecen a $Omega(n!)$ son:

  $n^(log n)$

  $4^n$

  $2^(2n) · n^(2n)$ 

  $n^2 log 3^n$ 

  $n^2.75$

  $n^2 / (log n)$
  
  $6n^3 - 3n^2 + 2^(n+2)$

  $(3n^2-2n + 8)^4$

  $3^2·n!$

  $(7n - 1)!$

  Las funciones que pertenecen a $Omega(n^8)$ son:

  $n^(log n)$

  $4^n$

  $2^(2n) · n^(2n)$ 

  $n^2 log 3^n$ 

  $n^2.75$

  $n^2 / (log n)$
  
  $6n^3 - 3n^2 + 2^(n+2)$

  $(3n^2-2n + 8)^4$

  Las funciones que pertenecen a $Omega(n^3)$ son:

  $n^(log n)$

  $4^n$

  $2^(2n) · n^(2n)$ 

  $n^2 log 3^n$ 

  $n^2.75$

  $n^2 / (log n)$
  
  $6n^3 - 3n^2 + 2^(n+2)$

  Las funciones que pertenecen a $Omega(n^2)$ son:

  $n^(log n)$

  $4^n$

  $2^(2n) · n^(2n)$ 

  $n^2 log 3^n$ 

  $n^2.75$

  $n^2 / (log n)$

  Las funciones que pertenecen a $Omega(n)$ son:

  $n^(log n)$

  $4^n$

  $2^(2n) · n^(2n)$ 

  Las funciones que pertenecen a $Omega(n^(log n))$ son:

  $n^(log n)$

  Estas funciones están contenidas de la siguiente forma 
  
  $Omega(n^(log^n)) subset Omega(n) subset Omega(n^2) subset Omega(n^3) subset Omega(n^8) subset Omega(n!)$.


  *Funciones ordenadas en términos de $Theta$, es de la forma $O(f(n)) sect Omega(f(n))$*

  Las funciones que pertenecen a $O(n^(log n))$ son:

  $n^(log n)$

  Las funciones que pertenecen a $O(n)$ son:

  $4^n$

  $2^(2n) · n^(2n)$ 

  Las funciones que pertenecen a $O(n^2)$ son:

  $n^2 log 3^n$ 

  $n^2.75$

  $n^2 / (log n)$

  Las funciones que pertenecen a $O(n^3)$ son:
  
  $6n^3 - 3n^2 + 2^(n+2)$

  Las funciones que pertenecen a $O(n^8)$ son:

  $(3n^2-2n + 8)^4$

  Las funciones que pertenecen a $O(n!)$ son:

  $3^2·n!$

  $(7n - 1)!$
  ]

= Problema 6
Opcional. Usando la definición de $O$ y $Ω$, para los siguientes incisos, demuestra formalmente, si $g(n) ∈ O(f(n))$ o si $g(n) ∈ Ω(f(n))$.

#align(center)[
  #figure(
    table(
      columns: 3,
      [-], [$g(n)$], [$f(n)$],
      [a)], [$2^n$], [$5^(log n)$],
      [b)], [$n^2/(log n)$], [$n(log n)^2$],
      [c)], [$log^3(n)$], [$n^0.5$],
      [d)], [$n!$], [$2^n$],
      [e)], [$3n$], [$2^n$],
      [f)], [$log 3^n$], [$log 2^n$],
    )
  ) 
]
#solucion(color:purple)[
  *Inciso a)*

  *P.D* $2^n in O(5^(log n))$

  *Demostración*

Queremos encontrar $c$ y $n_0$ tal que $2^n <= c dot 5^(log n)$ para todo $n >= n_0$.

Tomemos el logaritmo en base 5 en ambos lados:

$(log_5 2^n <= log_5 (c dot 5^(log n)))$

$(n dot log_5 2 <= log_5 c + log_5 5^(log n))$

$(n dot log_5 2 <= log_5 c + log n dot log_5 5)$ (usando la propiedad $log_a b^c = c dot log_a b$)

$(n dot log_5 2 <= log_5 c + log n)$ (ya que $log_5 5 = 1$)

A partir de aquí, notamos que el término $log_5 c$ es una constante, por lo que podemos escribir:

$(n dot log_5 2 <= C + log n)$, donde $(C = log_5 c)$.

Ahora, podemos ver que si elegimos $c = 2^(log_5 2)$ y $n_0 = 1$, entonces $2^n <= c dot 5^(log n)$ para todo $n >= n_0$, ya que $n dot log_5 2 <= C + log n$ será cierto. Por lo tanto, podemos decir que $2^n in Omega(5^(log n))$.

  *P.D* $2^n in Omega(5^(log n))$

  *Demostración*

Queremos encontrar $c$ y $n_0$ tal que $2^n >= c dot 5^(log n)$ para todo $n >= n_0$.

Tomemos el logaritmo en base 5 en ambos lados:

$log_5 2^n >= log_5(c dot 5^(log n))$

$n dot log_5 2 >= log_5 c + log_5 (5^(log n))$

$n dot log_5 2 >= log_5 c + log n dot log_5 5$ (usando la propiedad $(log_a b^c = c dot log_a b$)

$n dot log_5 2 >= log_5 c + log n)$ (ya que $log_5 5 = 1$)

A partir de aquí, notamos que el término $log_5 c$ es una constante, por lo que podemos escribir:

$n dot log_5 2 >= C + log n$, donde $C = log_5 c$.

Ahora, podemos ver que si elegimos $c = 1$ y $n_0 = 1$, entonces $2^n >= c dot 5^(log n)$ para todo $n >= n_0$, ya que $n dot log_5 2 >= C + log n$ será cierto. Por lo tanto, podemos decir que $2^n in Omega(5^(log n))$.

En resumen, hemos demostrado que $2^n in O(5^(log n))$ y $2^n in Omega(5^(log n))$.

  *Inciso d)*

  *P.D* $n! in O(2^n)$

  *Demostración*

  Queremos encontrar $c$ y $n_0$ tal que $n! <= c dot 2^n$ para todo $n >= n_0$.

Dado que $n!$ y $2^n$ son funciones factoriales y exponenciales respectivamente, podemos observar que $n!$ siempre será menor que $2^n$ a partir de algún punto. Esto se debe a que $2^n$ crece exponencialmente más rápido que n!.

Podemos tomar $c = 1$ y $$n_0 = 4$$ para demostrar esto:

Para $n = 4$, tenemos $4! = 24$ y $2^4 = 16$, lo cual cumple $4! <= 2^n$.

Para cualquier $n$ mayor o igual a 4, $2^n$ seguirá creciendo exponencialmente más rápido que $n!$, y, por lo tanto, $n!$ estará acotado superiormente por $2^n$.

  *P.D* $n! in Omega(2^n)$

  *Demostración*

  Queremos encontrar $c$ y $n_0$ tal que $n! >= c dot 2^n$ para todo $n >= n_0$.

  Dado que $n!$ es una función factorial que crece más rápido que $2^n$, podemos tomar $c = 1$ y $n_0 = 0$ para demostrar esto.

  Para cualquier valor de $n$, $n!$ siempre será mayor o igual que $2^n$. Por lo tanto, $n! in Omega(2^n)$.

  En resumen, hemos demostrado que $n!$ está acotado superior y inferiormente por 2^n. Esto significa que $n!$ y $2^n$ tienen una relación asintótica, pero la relación es más fuerte en el sentido de $Omega$, ya que $n!$ crece más rápido que $2^n$.

  *Inciso e)*

  *P.D* $3n in O(2^n)$

  *Demostración*

  Ahora, veamos si podemos demostrar alguna de estas relaciones para $3n$ y $2^n$.

  Primero, consideremos la relación $3n in O(2^n)$:

  Queremos encontrar $c$ y $n_0$ tal que $3n <= c dot 2^n$ para todo $n >= n_0$.

  Tomemos el logaritmo en base 2 en ambos lados de la desigualdad:

  $log_2 3n <= log_2 (c dot 2^n)$

  $log_2 3n <= log_2 c + log_2 2^n$
  
  $log_2 3n <= log_2 c + n$

  A partir de aquí, notamos que el término $log_2 c$ es una constante, por lo que podemos escribir:

  $log_2 3n <= C + n$, donde $C = log_2 c$.

  Ahora, si elegimos $c=1$ y $n_0 = 1$, entonces tendremos:

  $log_2 3n <= 1 + n$

  Esto significa que para cualquier $n >= n_0 = 1$, $3n$ estará acotado superiormente por $2^n$. Por lo tanto, $3n in O(2^n)$.

  *P.D* $3n in Omega(2^n)$

  *Demostración*

  Queremos encontrar $c$ y $n_0$ tal que $3n >= c dot 2^n$ para todo $n >= n_0$.

  Si tomamos $c = 1$ y $n_0 = 1$, tendremos:

  $(3n >= 1 dot 2^n)$

  Esto es cierto para cualquier $n >= n_0 = 1$, ya que $3n$ crece al menos tan rápido como $2^n$.

  En resumen, hemos demostrado que $3n$ está acotado superiormente por $2^n$ (es decir, $3n in O(2^n)$) y que 3n está acotado inferiormente por $2^n$ (es decir, $3n in Omega(2^n)$).

  *Inciso f)*

  *P.D* $log 3^n in O(log (2^n))$

  *Demostración*

Queremos encontrar $c$ y $n_0$ tal que $log 3^n <= c dot log 2^n$ para todo $n >= n_0$.

Utilicemos las propiedades de los logaritmos para simplificar la expresión:

$log 3^n = n dot log 3$

$log 2^n = n dot log 2$

La desigualdad se convierte en:

$(n dot log 3 <= c dot n dot log 2)$

Podemos simplificar $n$ en ambos lados:

$log 3 <= c dot log 2$

Ahora, podemos ver que esta desigualdad es cierta para cualquier $c$ positivo, ya que $log 3$ y $log 2$ son constantes positivas. Por lo tanto, no importa qué valores elijamos para $c$ y $n_0$, siempre será cierto que $(log 3^n <= c dot log 2^n)$ para todo $n >= n_0$.

  *P.D* $log 3^n in Omega(log 2^n)$

  *Demostración*

  Queremos encontrar $c$ y $n_0$ tal que $log 3^n >= c dot log 2^n$ para todo $n >= n_0$.

Utilicemos las mismas simplificaciones que hicimos antes:

$log 3^n = n dot log 3$

$log 2^n = n dot log 2$

La desigualdad se convierte en:

$n dot log 3 >= c dot n dot log 2$

Podemos simplificar $n$ en ambos lados:

$log 3 >= c dot log 2$

Al igual que en el caso anterior, esta desigualdad es cierta para cualquier $c$ positivo, ya que $log 3$ y $log 2$ son constantes positivas.

En resumen, hemos demostrado que $log 3^n$ está acotado superiormente por $log 2^n$ (es decir, $log 3^n in O(log 2^n))$ y que $log 3^n$ está acotado inferiormente por $log 2^n$ (es decir, $log 3^n in Omega(log 2^n))$. Esto significa que $log 3^n$ y $log 2^n$ tienen una relación de crecimiento logarítmico similar en términos asintóticos, y podemos decir que son asintóticamente equivalentes.

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
