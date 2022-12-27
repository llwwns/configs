; extends
; type
(type_alias name: (type_identifier) @spell)
(type_spec name: (type_identifier) @type.definition @spell)

; variable
(short_var_declaration 
  left: (expression_list
          (identifier) @spell)) 
(const_spec
  name: (identifier) @spell)
(var_spec 
  name: (identifier) @spell)

; label
(label_name) @label @spell

; function
(parameter_declaration (identifier) @parameter @spell)
(variadic_parameter_declaration (identifier) @parameter @spell)

(function_declaration
  name: (identifier) @function @spell)

(method_declaration
  name: (field_identifier) @method @spell)

(method_spec 
  name: (field_identifier) @method @spell) 

; struct
(field_declaration name: (field_identifier) @field @spell)
