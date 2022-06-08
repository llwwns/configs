(local actions (require :telescope.actions))
(local sorters (require :telescope.sorters))
((-> :telescope (require) (. :setup)) {
  :defaults {
    :mappings {
      :i {
        :<esc> actions.close
      }
    }
    :extensions {
      :zf-native {
        :file {
          :enable true
          :highlight_results true
          :match_filename true
        }
        :generic {
          :enable true
          :highlight_results true
          :match_filename false
        }
      }
    }
    :borderchars ["─" "│" "─" "│" "┌" "┐" "┘" "└"]
    :sorting_strategy "ascending"
    :layout_strategy "horizontal"
    :layout_config {
      :horizontal {
        :prompt_position "top"
      }
    }
  }
})

((-> :telescope (require) (. :load_extension)) :zf-native)
