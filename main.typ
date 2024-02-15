#import "paper_template.typ": *

#show: thmrules

#show: doc => paper(
  // font: "palatino", // "Times New Roman"
  // fontsize: 12pt, // 12pt
  title: [#lorem(5)], // title 
  authors: (
    (
      name: "Theresa Tungsten",
      affiliation: "Artos Institute",
      email: "tung@artos.edu",
      note: "123",
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
  acknowledgments: "This paper is a work in progress. Please do not cite without permission.", // Acknowledgements 
  bibloc: "My Library.bib",
  bibstyle: "chicago-author-date", // ieee, chicago-author-date, apa, mla
  // bibtitle: "References",
  doc,
)

// your main text goes here
#set heading(numbering: "1.")
#set text(spacing: 100%)
#set par(
  leading: 1.2em,
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
// #cite(<abarbanell1998abnormal11>,<barbanell1998abnormal>)
#lorem(100)

= Conclusion
#lorem(100)

= Theorem

#definition[
  A natural number is called a #highlight[_prime number_] if it is greater
  than 1 and cannot be written as the product of two smaller natural numbers.
]
#example[
  The numbers $2$, $3$, and $17$ are prime.
  @cor_largest_prime shows that this list is not exhaustive!
]

#theorem("Euclid")[
  There are infinitely many primes.
]

#proof[
  Suppose to the contrary that $p_1, p_2, dots, p_n$ is a finite enumeration
  of all primes. Set $P = p_1 p_2 dots p_n$. Since $P + 1$ is not in our list,
  it cannot be prime. Thus, some prime factor $p_j$ divides $P + 1$.  Since
  $p_j$ also divides $P$, it must divide the difference $(P + 1) - P = 1$, a
  contradiction.
]

#corollary[
  There is no largest prime number.
] <cor_largest_prime>
#corollary[
  There are infinitely many composite numbers.
]


= Test

we are the best in the world. 

#lemma[
  The number $1$ is not prime.
]


this is a test.
