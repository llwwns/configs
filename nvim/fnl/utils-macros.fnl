
(fn require-fun [full ...] 
  (let [(_ _ name fun) (full:find "([%w._-]+)#([%w_-]+)")]
  `((-> ,name (require) (. ,fun)) ,...)))

{:require-fun require-fun}
