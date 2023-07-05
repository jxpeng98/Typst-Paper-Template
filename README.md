# Typst-Paper-Template

Following the official tutorial, I create a single-column paper template for general use. You can use it for papers published on SSRN etc.

## How to use

1. Download the template or clone the repository.
2. generate your bibliography file using `.biblatex` and store the file in the same folder of the template.
3. modify the `main.tex` file and compile it.

In the template, you can modify the following parameters:
* Font: You can choose the font that you like. The default font is Times New Roman. You can also use Palatino by uncommenting the line `font: "palatino"`
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
  2. `bibstyle`: the style of your reference. You can choose from `ieee`, `chicago-author-date`, `apa`, and `mla`. The default style is `ieee`.
  3. `bibtitle`: the title of your reference section. The default title is `References`.

```
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
    ),
  ),
  date: "July 2023",
  abstract: lorem(80),
  keywords: [
    Missing Data,
    Imputation,
    Multiple Imputation,
    Bayesian,],
  JEL: [G11, G12],
  note: "This paper is a work in progress. Please do not cite without permission.",
  bibloc: "My Library.bib",
    bibstyle: "chicago-author-date", // ieee, chicago-author-date, apa, mla
    bibtitle: "References",
  doc,
)
// Your main text

```
## Preview

Here is a screenshot of the template:
![ZFILCK](https://cdn.jsdelivr.net/gh/jxpeng98/imagerepo@main/2023/07/ZFILCK.png)

![PWF6KZ](https://cdn.jsdelivr.net/gh/jxpeng98/imagerepo@main/2023/07/PWF6KZ.png)
