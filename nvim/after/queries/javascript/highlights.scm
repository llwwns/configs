; extends

; class
(class_declaration
  name: (identifier) @spell)

(field_definition
  property: (property_identifier) @spell)

(method_definition
  parameters: (formal_parameters (identifier) @spell))

(method_definition
  name: (property_identifier) @spell)

; variable
(variable_declarator
  name: (identifier) @spell)

(variable_declarator
  name: (object_pattern (shorthand_property_identifier_pattern) @spell))

(object_pattern (pair_pattern value: (identifier) @spell))

(array_pattern (identifier) @spell)
