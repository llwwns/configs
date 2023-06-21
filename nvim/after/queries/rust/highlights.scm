; extends
(let_declaration
  pattern: (identifier) @spell)
(for_expression
  pattern: (identifier) @spell)
(function_item
  name: (identifier) @spell)
(use_declaration
  argument: (use_as_clause alias: (identifier) @spell))
(struct_item
  name: (type_identifier) @spell)
(type_item
  name: (type_identifier) @spell)
(trait_item
  name: (type_identifier) @spell)
(macro_definition
  name: (identifier) @spell)
(token_binding_pattern
  name: (metavariable) @spell)
