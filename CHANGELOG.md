# 0.7.0

- to make the template more flexible, all integrated packages are removed from the `main.typ`. They have been saved in the `extra.typ` file.
- Here is the list of removed packages:
  - `ctheorems`
  - `rich-counters`
  - `mitex`
  - `cetz`
  - `tablex`
  - `tablem`

They have been imported to the `main.typ` file by default. If you do not want to use them, you can comment out the import statement in the `main.typ` file.

```typst
#import "extra.typ": *
#show: great-theorems-init
```
