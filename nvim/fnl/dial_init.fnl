(macro cycle-word [...] `(augend.constant.new { :elements [,...] :word true :cycle true }))
(macro cycle-elem [...] `(augend.constant.new { :elements [,...] :word false :cycle true }))

(local augend (require :dial.augend))

(: (-> :dial.config (require) (. :augends)) :register_group {
  :default [
    augend.integer.alias.decimal
    augend.integer.alias.hex
    (. augend.date.alias "%Y/%m/%d")
    augend.constant.alias.bool
    augend.semver.alias.semver
    (cycle-elem :&& :||)
    (cycle-word :and :or)
  ]
})
