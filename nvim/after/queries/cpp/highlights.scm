; extends

(namespace_definition name: (identifier) @spell)

(class_specifier name: (type_identifier) @spell)
(struct_specifier name: (type_identifier) @spell)
(union_specifier name: (type_identifier) @spell)
(enum_specifier name: (type_identifier) @spell)

(enumerator name: (identifier) @spell)
(type_parameter_declaration (type_identifier) @spell)
(alias_declaration name: (type_identifier) @spell)
(type_definition declarator: (type_identifier) @spell)
(string_literal) @spell
