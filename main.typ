#import "paper_template.typ": paper
#show: doc => paper(
  font: "palatino", // "Times New Roman"
  title: [#lorem(5)], // title 
  authors: (
    (
      name: "Theresa Tungsten",
      affiliation: "Artos Institute",
      email: "tung@artos.edu",
      note: "123",
    ),
    (
      name: "Theresa Tungsten",
      affiliation: "Artos Institute",
      email: "tung@artos.edu",
      note: "",
    ),
  ),
  date: "July 2023",
  abstract: lorem(80), // replace lorem(80) with [ Your abstract here. ]
  keywords: [
    Missing Data,
    Imputation,
    Multiple Imputation,
    Bayesian,],
  JEL: [G11, G12],
  acknowledgements: "This paper is a work in progress. Please do not cite without permission.", // Acknowledgements 
  bibloc: "My Library.bib",
    bibstyle: "chicago-author-date", // ieee, chicago-author-date, apa, mla
    bibtitle: "References",
  doc,
)
// your main text goes here
#set heading(numbering: "1.")
#set text(spacing: 100%)
#set par(leading: 1.5em)
#set par(
  first-line-indent: 2em,
  justify: true,
)
= Introduction <intro>
@intro
#lorem(300)

== Motivation
@abarbanell1998abnormal11
#lorem(140)

= Data 
#cite("abarbanell1998abnormal11","abarbanell1998abnormal")
#lorem(100)

= Conclusion
#lorem(100)



