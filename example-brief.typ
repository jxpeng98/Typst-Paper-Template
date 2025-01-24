// #import "@local/ssrn-scribe:0.4.8": paper
// #import "@local/ssrn-scribe:0.4.8": *

#import "paper_template.typ": paper
#import "paper_template.typ": *

#show: doc => paper(
  maketitle: false, // whether to add new page for title
  title: [#lorem(5)], // title 
  authors: (
    (
      name: "Theresa Tungsten",
    ),
    (
      name: "John Doe",
      affiliation: "University of Nowhere",
      note: "456",
    )
  ),
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

= Test

we are the best in the world. 

this is a test.