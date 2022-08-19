
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
      `(use ,name)
      (let [out [name]]
        (each [idx val (ipairs opts)]
          (when (= 1 (% idx 2))
              (let [nval (. opts (+ idx 1))]
                (tset out val nval))))
         `(use ,out)))))

{
  : require-fun
  : packer
  : use!
}
