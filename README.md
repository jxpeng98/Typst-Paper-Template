# Typst-Paper-Template

Following the official tutorial, I create a single-column paper template for general use. You can use it for papers published on SSRN etc.

## Updates

* v0.4.1: can work stable without error.
* v0.2.6: modify the logic of bibliography importing. You should create the `.bib` in the main file rather than entering the details in the container since I use this template as a local package. However, Typst does note support the absolute path of the `.bib` file. So this is a compromise solution.

## How to use

1. Download the template or clone the repository.
2. generate your bibliography file using `.biblatex` and store the file in the same directory of the template.
3. modify the `main.typ` file and compile it.
   ***Note:* You should have `paper_template.typ` and `main.typ` in the same directory.**

In the template, you can modify the following parameters:

* Font: You can choose the font that you like. The default font is `Times New Roman`. You can also use Palatino by uncommenting the line `font: "palatino", // "Times New Roman"`
* Fontsize: You can choose the font size that you like. The default font size is `11pt`. You can also use `12pt` or `10pt` by uncommenting the line `fontsize: 12pt, // 11pt`
* Author: You can add as many authors as you like. But you need to include four parameters for each author: name, affiliation, email, and note within parentheses. If you don't have the information, you can leave it blank.
  ```
      (
      name: "",
      affiliation: "",
      email: "",
      note: "",
      ),
  ```
* Abstract: You can add your abstract with `[Your abstract]`.
* Acknowledgement: You can add your acknowledgement with `[Your acknowledgement]`.
* Bibliography: You can add your reference BibLaTex:
  1. `bibloc`: the location of your `.bib` file.
  2. `bibstyle`: the style of your reference. You can choose from `ieee`, `chicago-author-date`, `apa`, and `mla`. The default style is `ieee`. You can change it by uncommenting the line `bibstyle: "chicago-author-date", // ieee, chicago-author-date, apa, mla`
  3. `bibtitle`: the title of your reference section. The default title is `References`.

```
#import "paper_template.typ": paper
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
  acknowledgments: "This paper is a work in progress. Please do not cite without permission.", // Acknowledgements 
  bibloc: "My Library.bib",
  // bibstyle: "chicago-author-date", // ieee, chicago-author-date, apa, mla
  // bibtitle: "References",
  doc,
)
// your main text goes here
```

## Preview

Here is a screenshot of the template:
![ZFILCK](https://cdn.jsdelivr.net/gh/jxpeng98/imagerepo@main/2023/07/ZFILCK.png)

![PWF6KZ](https://cdn.jsdelivr.net/gh/jxpeng98/imagerepo@main/2023/07/PWF6KZ.png)
