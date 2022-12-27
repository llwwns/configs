; extends

; class
(class_declaration
  name: (type_identifier) @spell)

(required_parameter
  pattern: (identifier) @spell)

(method_definition
  name: (property_identifier) @spell)

(public_field_definition
  name: (property_identifier) @spell)

(public_field_definition
  name: (private_property_identifier) @spell)

; method, function
(required_parameter
  pattern: (array_pattern (identifier) @spell))

(required_parameter
  pattern: (object_pattern (shorthand_property_identifier_pattern) @spell))

(required_parameter
  pattern: (object_pattern (pair_pattern value: (identifier) @spell)))

(optional_parameter
  pattern: (identifier) @spell)

; interface
(interface_declaration
  name: (type_identifier) @spell)

(property_signature name: (property_identifier) @spell)

(property_signature name: (private_property_identifier) @spell)

(method_signature name: (property_identifier) @spell)

; variable
(variable_declarator name: (identifier) @spell)
(variable_declarator name: (array_pattern (identifier) @spell) @spell)
(variable_declarator name: (object_pattern (shorthand_property_identifier_pattern) @spell) @spell)
(variable_declarator name: (object_pattern (pair_pattern value: (identifier) @spell)) @spell)

; type
(type_alias_declaration name: (type_identifier) @spell)
(type_parameter name: (type_identifier) @spell)
