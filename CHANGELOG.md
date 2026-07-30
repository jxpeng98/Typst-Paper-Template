# 0.10.0 - 2026-07-27

- Introduce grouped `meta`, `theme`, and `layout` dictionaries while preserving
  the flat 0.9.x arguments.
- Add coordinated `compact`, `default`, and `relaxed` rhythm presets, including
  compatibility aliases for `balanced` and `spacious`.
- Rebuild the title block, author grid, front matter, and heading hierarchy
  around semantic typography and grayscale design tokens.
- Narrow the default front-matter measure and slightly open the manuscript
  leading so long abstracts and body pages read more comfortably.
- Keep optional theorem, table, math-conversion, and diagram dependencies out of
  the core template and document the Typst 0.15 compatibility boundary.

# 0.9.1

- Rename all snake_case variables to kebab-case for consistency.

# 0.9.0

- Reworked the cover page layout with wider front matter, consistent spacing, and left-aligned footnotes.
- Added layout controls for author grids and typography (`author_columns`, `author_alignment`, `cover_*`, `inline_*`, `body_*`, `frontmatter_gap`).
- Tuned default line and paragraph spacing, including additional lead beneath level-one headings for better readability.
