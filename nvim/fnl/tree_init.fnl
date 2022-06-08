(local tree_cb (-> :nvim-tree.config (require) (. :nvim_tree_callback)))

((-> :nvim-tree (require) (. :setup)) {
  :view {
    :width 30
    :side "left"
    :auto_resize false
  }
  :renderer {
    :icons {
      :show {
        :file true
        :folder true
        :folder_arrow true
        :git false
      }
    }
    :indent_markers {
      :enable true
    }
  }
})
