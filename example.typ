// #import "@local/ssrn-scribe:0.4.8": paper
// #import "@local/ssrn-scribe:0.6.0": *

#import "paper_template.typ": paper
#import "paper_template.typ": *

// if you do not want to use the integrated packages, you can comment out the following lines
#import "extra.typ": *
#show: great-theorems-init

#show: doc => paper(
  font: "PT Serif", // "Times New Roman"
  fontsize: 12pt, // 12pt
  maketitle: true, // whether to add new page for title
  title: [#lorem(5)], // title 
  subtitle: "A work in progress", // subtitle
  authors: (
    (
      name: "Theresa Tungsten",
    ),
    (
      name: "John Doe",
      affiliation: "University of Nowhere",
      email: "jd@Nowhere.edu",
      note: "456",
    )
  ),
  date: "July 2023",
  abstract: lorem(80), // replace lorem(80) with [ Your abstract here. ]
  keywords: [
    Imputation,
    Multiple Imputation,
    Bayesian,],
  JEL: [G11, G12],
  acknowledgments: "This paper is a work in progress. Please do not cite without permission.", 
  bibliography: bibliography("bib.bib", title: "References", style: "apa"),
  doc
)


// your main text goes here

= Introduction <intro>
@intro
check
#lorem(300)


== Motivation

#lorem(140)

= Data
@abarbanell1998abnormal

@abarbanell1998abnormal11

// #cite(<abarbanell1998abnormal11>,<barbanell1998abnormal>)
#lorem(100)

= Conclusion

#lorem(100)

= Theorem

#remark[
  A natural number is called a #highlight[_prime number_] if it is greater
  than 1 and cannot be written as the product of two smaller natural numbers.
]

#lemma[
  The numbers $2$, $3$, and $17$ are prime.
  @cor_largest_prime shows that this list is not exhaustive!
]

#theorem(title: "Euclid")[
  There are infinitely many primes.
]

#proof[
  Suppose to the contrary that $p_1, p_2, dots, p_n$ is a finite enumeration
  of all primes. Set $P = p_1 p_2 dots p_n$. Since $P + 1$ is not in our list,
  it cannot be prime. Thus, some prime factor $p_j$ divides $P + 1$.  Since
  $p_j$ also divides $P$, it must divide the difference $(P + 1) - P = 1$, a
  contradiction.
]

#remark[
  There is no largest prime number.
] <cor_largest_prime>

#remark[
  There are infinitely many composite numbers.
]


= Test

we are the best in the world. 

#lemma[
  The number $1$ is not prime.
]


this is a test.
Equation without number:
#eq(
  $
  x
  $
)
---


#mitex(`
  \begin{align*}
    \frac{1}{2} + \frac{1}{3} &= \frac{5}{6} \\
    \frac{1}{2} + \frac{1}{3} &= \frac{5}{6} \\
  \end{align*}
`)


#tablex(
  columns: 4,
  align: center + horizon,
  auto-vlines: false,

  // indicate the first two rows are the header
  // (in case we need to eventually
  // enable repeating the header across pages)
  header-rows: 2,

  // color the last column's cells
  // based on the written number
  map-cells: cell => {
    if cell.x == 3 and cell.y > 1 {
      cell.content = {
        let value = int(cell.content.text)
        let text-color = if value < 10 {
          red.lighten(30%)
        } else if value < 15 {
          yellow.darken(13%)
        } else {
          green
        }
        set text(text-color)
        strong(cell.content)
      }
    }
    cell
  },

  /* --- header --- */
  rowspanx(2)[*Username*], colspanx(2)[*Data*], (), rowspanx(2)[*Score*],
  (),                 [*Location*], [*Height*], (),
  /* -------------- */

  [John], [Second St.], [180 cm], [5],
  [Wally], [Third Av.], [160 cm], [10],
  [Jason], [Some St.], [150 cm], [15],
  [Robert], [123 Av.], [190 cm], [20],
  [Other], [Unknown St.], [170 cm], [25],
)


#tablem[
  | *Name* | *Location* | *Height* | *Score* |
  | ------ | ---------- | -------- | ------- |
  | John   | Second St. | 180 cm   |  5      |
  | Wally  | Third Av.  | 160 cm   |  10     |
]

#let three-line-table = tablem.with(
  render: (columns: auto, ..args) => {
    tablex(
      columns: columns,
      auto-lines: false,
      align: center + horizon,
      hlinex(y: 0),
      hlinex(y: 1),
      ..args,
      hlinex(),
    )
  }
)

#three-line-table[
  | *Name* | *Location* | *Height* | *Score* |
  | ------ | ---------- | -------- | ------- |
  | John   | Second St. | 180 cm   |  5      |
  | Wally  | Third Av.  | 160 cm   |  10     |
]



#cetz.canvas({
let data = ([\*], ([A A], [A.A], [A.B], [A.c]), ([B], [B.A]))
cetz.tree.tree(data,direction: "right")})
