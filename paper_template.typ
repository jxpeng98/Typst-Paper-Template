// this is the template for my personal working paper 
#let paper(
  font: "Times New Roman",
  title: none,
  authors: (),
  date: "",
  abstract: [],
  keywords: [],
  JEL: [],
  acknowledgements: none,
  bibloc: none,
  bibstyle: "ieee",
  bibtitle: "References",
  doc,
) = {
set par(leading: 1em)
  // Set and show rules from before.
set text(
  font: font,
  size: 10pt
)
set footnote(numbering: "*")
set footnote.entry(
  separator: line(length: 100%, stroke: 0.5pt)
)
set footnote.entry(indent: 0em)
set align(left)
  text(17pt, align(center,{title;footnote(acknowledgements)}))
    v(15pt)

  let count = authors.len()
  let ncols = calc.min(count, 3)
set footnote.entry(indent: 0em)
  grid(
    columns: (1fr,) * ncols,
    row-gutter: 24pt,
    ..authors.map(author => {
      text(14pt,align(center,{author.name; 
      {
        if author.note != ""  {
          footnote(author.note)
          }
      };[\ ]
      author.affiliation; [\ ]
      link("mailto:" + author.email)})
      )
}),
  )
  v(5pt)
  align(center,[This Version: #date])
    v(25pt)
    
  par(justify: true)[
    #align(center, [*Abstract*])
    #abstract
  ]
    v(10pt)
    par(justify: true)[
      #set align(left) 
      #emph([*Keywords:*]) #keywords
    ]
    v(5pt)
    par(justify: true)[
        #set align(left) 
        #emph([*JEL Classification:*]) #JEL
    ]
  pagebreak()
  set heading(numbering: "1.")
set math.equation(numbering: "(1)")
  set footnote(numbering: "1")
set footnote.entry(
  separator: line(length: 100%, stroke: 0.5pt)
)
set footnote.entry(indent: 0em)
  set align(left)
  columns(1, doc)
pagebreak()
bibliography(
    bibloc,
    style: bibstyle,
    title: bibtitle,
)
}
