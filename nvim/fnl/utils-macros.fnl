
(fn require-fun [full ...] 
  (let [(_ _ name fun) (full:find "([%w._-]+)#([%w_-]+)")]
  `((-> ,name (require) (. ,fun)) ,...)))

(fn packer [...]
  `(require-fun :packer#startup
    (fn [,(sym :use)]
      (do ,...))))

(fn use! [name ...]
  (let [opts [...]]
    (if (= 0 (length opts))
      name
      (let [out [name]]
        (each [idx val (ipairs opts)]
          (when (= 1 (% idx 2))
              (let [nval (. opts (+ idx 1))]
                (tset out val nval))))
         out))))


(fn lazy [...]
  `(require-fun :lazy#setup
    (do ,...)))


(fn parse-sym [xs]
  (if (or (in-scope? xs) (not (sym? xs)))
      (do xs)
      (tostring xs)))

(fn set! [name val]
  `(tset vim.opt ,(parse-sym name) ,val))

(fn g! [name val]
  `(tset vim.g ,(parse-sym name) ,val))

{
  : require-fun
  : packer
  : lazy
  : use!
  : set!
  : g!
}
