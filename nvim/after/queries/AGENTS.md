# Treesitter Query Guidelines

This directory contains additional Treesitter queries for Neovim. Place each
query in `<language>/highlights.scm`, using the Treesitter parser name rather
than the filetype name.

## `@spell` guidelines

- Apply `@spell` only to text that should be checked as natural language.
- Prefer comments, descriptive string content, and names defined by the user.
- Definition names such as functions, methods, types, classes, structs, enums,
  fields, variables, and keys are generally appropriate targets.
- Do not apply it to references, built-ins, keywords, operators, command names,
  flags, paths, URLs, or other machine-oriented values.
- Avoid matching a generic `identifier` node without context. Restrict the
  match to a definition or another suitable parent node so definitions can be
  distinguished from references.
- A node may have `@spell` in addition to existing captures such as `@function`,
  `@type`, or `@property`.
- Match the smallest suitable text range. Follow the parser's node structure
  and existing queries when deciding whether to include interpolation,
  escaping, or surrounding string syntax.

## Extending existing queries

Files under `after/queries` that add to an existing Neovim or plugin query must
start with:

```scm
; extends
```

Keep the existing highlights intact and add only the required patterns. Do not
replace the base query unless replacement is explicitly intended.

## Validation

- Confirm new node names against the parser's syntax tree or the installed
  base query before using them.
- Parse the query and test representative source snippets to ensure captures
  match the intended nodes and do not match excluded references or commands.
- Check the final diff for formatting errors.
