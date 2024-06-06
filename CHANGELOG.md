# 0.6.0
- Make items more flexible than the previous version
  - All the following items are optional:
    - `font`
    - `fontsize`
    - `subtitle`
    - `date`
    - `abstract`
    - `keywords`
    - `JEL`
    - `acknowledgements`
    - Also the items in the `authors` list are optional
      - `name`
      - `affiliation`
      - `email`
      - `note`

**Note**: All the above items can be removed from the template. **However, you must keep the comma at the end of the bracket of the author's list.**
```typst
    authors: (
    (
      name: "Theresa Tungsten",
    ), // this comma must be kept if you have author items
    (
      name: "John Doe",
      affiliation: "University of Nowhere",
      email: "jd@Nowhere.edu",
      note: "456",
    )
  ),
```

