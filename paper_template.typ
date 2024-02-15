///////////////////////////////
// This Typst template is for working paper draft.
// It is based on the general SSRN papaer.
// Copyright (c) 2023
// Author:  Jiaxin Peng
// License: MIT
// Version: 0.2
// Date:    2024-02-14
// Email:   jiaxin.peng@outlook.com
///////////////////////////////
#import "@preview/ctheorems:1.1.0": *

#let paper(
  font: "PT Serif",
  fontsize: 11pt,
  title: none,
  authors: (),
  date: "",
  abstract: [],
  keywords: [],
  JEL: [],
  acknowledgments: none,
  bibloc: none,
  bibstyle: "ieee", 
  bibtitle: "References",
  doc,
) = {

set par(leading: 1em)
  // Set and show rules from before.

set text(
  font: font,
  size: fontsize
)
set footnote(numbering: "*")
set footnote.entry(
  separator: line(length: 100%, stroke: 0.5pt)
)
set footnote.entry(indent: 0em)
set align(left)
  text(17pt, align(center,{title;footnote(acknowledgments)}))
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
  v(20pt)
  if date != "" {
  align(center,[This Version: #date])
    v(25pt)
    }
  if abstract != [] {
  par(justify: true)[
    #align(center, [*Abstract*])
    #abstract
  ]
    v(10pt)
    }
    if keywords != [] {
    par(justify: true)[
      #set align(left) 
      #emph([*Keywords:*]) #keywords
    ]
    v(5pt)
    }
    if JEL != [] {
    par(justify: true)[
        #set align(left) 
        #emph([*JEL Classification:*]) #JEL
    ]
    v(5pt)
    }
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

// #set heading(numbering: "1.1.")


#let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"))

#let corollary = thmplain(
  "corollary",
  "Corollary",
  base: "theorem",
  titlefmt: strong
)

#let definition = thmbox(
  "definition", 
  "Definition",
  base_level: 1,
  stroke: rgb("#0000ff") + 1pt,
  fill: rgb("#eeeeff")
)

#let lemma = thmbox(
  "theorem", 
  "Lemma",
  base: "theorem",
  fill: rgb("#eeffee"),
  titlefmt: strong)

#let example = thmplain("example", "Example").with(numbering: none)

#let proof = thmplain(
  "proof",
  "Proof",
  base: "theorem",
  bodyfmt: body => [
    #body #h(1fr) $square$
    ]
).with(numbering: none)

#let remark = thmplain(
  "remark", 
  "Remark"
  ).with(numbering: none)
