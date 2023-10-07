#let conf(
  materia: none,
  tarea: none,
  profesor: (nombre: none, sexo: none),
  ayudantes: (),
  alumnos: (),
  fecha: datetime.today(),
  encabezado: "Contenidos",
  bibliografia: (enable: true, path: "biblio.bib"),
  doc,
) = {
  set text(font: "Noto Serif")
  set heading(numbering: "1.1.")
  set page(
    margin: (x: 1.56cm,),
    header: locate(loc =>
      if loc.page() != 1 {
        let header = style(styles => {
          let header-text = {
            materia + h(1fr)
            tarea + h(1fr)
            datetime.today()
              .display("[day]/[month]/[year]")
          }
          let measures = measure(header-text, styles)
  
          header-text + v(-0.65em)
          line(length: 100%)
        })
  
        header
      }
    ),
    footer: {
      set align(center)
      line(length: 100%)
      v(-0.65em)
      counter(page).display(
        (n, m) => [ Página #n de #m ],
        both: true,
      )
    },
  )
  
  let header = {
    line(length: 100%)
    grid(
      columns: (1fr, 3fr, 1fr),
      gutter: 5pt,
      rows: 14em,
      image("imgs/fc.svg"),
      [
        #set align(horizon)
        #text(20pt)[*#materia*]\
        #text(18pt)[*#tarea*]\
        #text(14pt)[
          #let (nombre, sexo) = profesor
          #if sexo == "M" {
            [*Profesor:* #nombre]
          } else if sexo == "F" {
            [*Profesora:* #nombre]
          } else {
            [*Profesor(a):* #nombre]
          }
        ]\
        #text(12pt)[
          #if ayudantes.len() == 1 {
            [*Ayudante:* #ayudantes.first()]
          } else {
            let l = (none,) * ayudantes.len()
            [
              //*Ayudantes:* #ayudantes.join(", ")
              #box(
                baseline: 100% - 0.65em,
                grid(
                  columns: 2,
                  gutter: 0.65em,
                  [*Ayudantes:*],
                  ..l.zip(ayudantes).flatten().slice(1),
                )
              )
            ]
          }
        ]\
        #text(12pt)[
        #alumnos.fold(none, (inc, alumno) => [
          #inc
          *Nombre*: #alumno.at("nombre")\
          *N°. de Cuenta.*: #alumno.at("cuenta")\
          *Correo*: #alumno.at("email")\
        ])
        ]\
      ],
      image("imgs/unam.svg"),
    )
    line(length: 100%)
  } 

  v(-2em)
  header
  set align(left)
  // let texto-integrantes = {
  //   if alumnos.len() == 1 {
  //     [
  //       = Alumno
  //       La Tarea fue realizada por:\
  //     ]
  //   } else {
  //     [
  //       = Integrantes
  //       Los integrantes de la tarea son:\
  //     ]
  //   }
  // }
  [
    // = #encabezado
    #doc
    // #pagebreak()
  //   #texto-integrantes
  //   #alumnos.fold(none, (inc, alumno) => [
  //     #inc
  //     - *Nombre*: #alumno.at("nombre")
  //       - *Num. de Cta.*: #alumno.at("cuenta")
  //       - *Correo*: #alumno.at("email")
  //   ])
  ]
  /* if bibliografia.at("enable") {
    show bibliography: set heading(numbering: "1.")
    bibliography(
      bibliografia.at("path"),
      title: "Bibliografía",
    )
  } */
}

#let pregunta(titulo, body) = {
  set heading(
    level: 2,
    supplement: [Pregunta],
  )

  heading(titulo)
  body
}

#let solucion(color: black, body) = {
  set block(
    fill: color.lighten(90%),
    inset: 5pt,
    radius: 5pt,
    stroke: 2pt + color,
    width: 100%,
  )

  block[
    #move(
      dx: -3pt, dy: -3pt,
      rect(
        fill: color,
        radius: (top-left: 3pt, bottom-right: 3pt),
        stroke: 3pt + color,
      )[
        #set text(14pt, white)
        *Solución:*
      ]
    )
    #body
  ]
}

#let pseudo(lang: "typ", it) = {
  // change this regex for custom delimiters, current one is double $
  let matches = it.text.matches((regex("\$\$.*\$\$")))
  let last-end = 0
  for match in matches {
    raw(lang: lang, it.text.slice(last-end, match.start))
    // set font
    show text: t => {
      set math.text(font: "New Computer Modern Math")
      t
    }
    eval("$" + match.text.slice(3, -3) + "$")
    last-end = match.end
  }
  raw(lang: lang, it.text.slice(last-end,))
}

#show raw: it => {
  if it.lang.contains("pseudo-") {
    let lang = it.lang.slice("pseudo-".len(),)
    // sets text size to be the same as raw blocks
    set text(size: 1.25em)
    pseudo(lang: lang, it)
  } else {
    it
  }
}

// Display inline code in a small box
// that retains the correct baseline.
#show raw.where(block: false): box.with(
  fill: luma(240),
  inset: (x: 3pt, y: 0pt),
  outset: (y: 3pt),
  radius: 2pt,
)

// Display block code in a larger block
// with more padding.
#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: 10pt,
  radius: 4pt,
)