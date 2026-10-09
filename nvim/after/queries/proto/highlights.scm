; extends

[
  (message_name)
  (enum_name)
  (service_name)
  (rpc_name)
] @spell

(rpc
  (message_or_enum_type
    (identifier) @spell))

[
  (field (identifier))
  (map_field (identifier))
  (oneof_field (identifier))
  (enum_field (identifier))
] @spell
