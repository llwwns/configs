(local windline (require "windline"))
(local helper (require "windline.helpers"))
(local sep helper.separators)
(local vim_components (require "windline.components.vim"))

(local b_components (require "windline.components.basic"))
(local state _G.WindLine.state)

(local lsp_comps (require "windline.components.lsp"))
(local git_comps (require "windline.components.git"))

(local cache_utils (require "windline.cache_utils"))

(fn get-file-name [bufnr]
  (let [file-name (-> "%f" (vim.fn.expand) (vim.fn.pathshorten 2))]
    (if (= "" file-name) "[No Name] " (.. file-name " "))))

(fn cache-file-name []
  (cache_utils.cache_on_buffer "BufEnter" "WL_filename" get-file-name))

(local navic (require "nvim-navic"))

(local hl_list {
  :Black [ "white" "black" ]
  :White [ "black" "white" ]
  :Inactive [ "InactiveFg" "InactiveBg" ]
  :Active [ "ActiveFg" "ActiveBg" ]
})

(local text_colors {
  :Normal "blue_light"
  :Insert "green"
  :Visual "yellow"
  :Replace "red"
  :Command "magenta"
})

(fn table.flatmap [tbl func]
    (let [ret_tbl {}]
      (each [k v (pairs tbl)]
        (let [t2 (func k v)]
          (each [k2 v2 (pairs t2)]
            (tset ret_tbl k2 v2))))
      ret_tbl))

(local basic {
  :divider [ b_components.divider "" ]
  :space [ " " "" ]
  :file_name_inactive [ b_components.full_file_name hl_list.Inactive ]
  :line_col_inactive [ b_components.line_col hl_list.Inactive ]
  :progress_inactive [ b_components.progress hl_list.Inactive ]
  :vi_mode {
    :name "vi_mode"
    :hl_colors (table.flatmap text_colors (fn [k v] {
        (.. k "S1") [ "ActiveBg" "InactiveBg" ]
        (.. k "Icon") [ v "ActiveBg" ]
        (.. k "Before") [ v "ActiveBg" ]
        k [ "black" v "bold" ]
        (.. k "After") [ "white" v ]
      }))
    :text (fn [] [
        [ sep.left_rounded (.. (. state.mode 2) "Before") ]
        [ (.. (. state.mode 1) " ") (. state.mode 2) ]
        [ sep.left_rounded (.. (. state.mode 2) "After") ]
      ])
  }
  :lsp_diagnos {
    :name "diagnostic"
    :hl_colors {
      :red [ "red" "ActiveBg" ]
      :yellow [ "yellow" "ActiveBg" ]
      :blue [ "blue" "ActiveBg" ]
    }
    :width 90
    :text #(if (lsp_comps.check_lsp) [
           [ (lsp_comps.lsp_error { :format "  %s" }) "red" ]
           [ (lsp_comps.lsp_warning { :format "  %s" }) "yellow" ]
           [ (lsp_comps.lsp_hint { :format "  %s" }) "blue" ]
         ] "")
  }
  :file {
    :name "file"
    :hl_colors {
      :default hl_list.White
    }
    :text (fn [bufnr winid width] 
      ;; (let [fname (if (> width 110)
      ;;   b_components.full_file_name (b_components.cache_file_name "[No Name]" "full"))]
        [
          [ (b_components.cache_file_icon { :default "" }) "default" ]
          [ " " "default" ]
          ;; [ (b_components.cache_file_name "[No Name]" "unique") "" ]
          [(cache-file-name)]
          [ (b_components.file_modified " ") "" ]
          ;; { b_components.cache_file_size(), '' },
        ])
  }
  :right {
    :hl_colors {
      :sep_before [ "black_light" "ActiveBg" ]
      :sep_after [ "black_light" "ActiveBg" ]
      :text [ "white" "black_light" ]
    }
    :text (fn [] [
        [ sep.left_rounded "sep_before" ]
        [ "l/n" "text" ]
        [ b_components.line_col "text" ]
        [ " " "text" ]
        [ b_components.progress "text" ]
        [ sep.right_rounded "sep_after" ]
      ])
  }
  :git {
    :name "git"
    :width 90
    :hl_colors {
      :green [ "green" "ActiveBg" ]
      :red [ "red" "ActiveBg" ]
      :blue [ "blue" "ActiveBg" ]
    }
    :text #(if (git_comps.is_git) [
      [ " " ]
      [ (git_comps.diff_added { :format "+ %s" }) "green" ]
      [ (git_comps.diff_removed { :format " - %s" }) "red" ]
      [ (git_comps.diff_changed { :format " ~ %s" }) "blue" ]
    ] "")
  }
  :navic [
    #(if (navic.is_available)
        (.. " " (navic.get_location)) "")
    [ "white" "InactiveBg" ]
  ]
})
(local winbar {
  :filetypes [ "winbar" ]
  :active [
    basic.navic
  ]
  ;; :enable (fn [bufnr winid] (navic.is_available))
})

(local default {
  :filetypes [ "default" ]
  :active  [
    [ " " hl_list.Active ]
    basic.vi_mode
    basic.file
    [ (vim_components.search_count) [ "black" "white" ] ]
    [ sep.right_rounded [ "white" "ActiveBg" ] ]
    basic.lsp_diagnos
    basic.git
    ;; basic.navic
    basic.divider
    [ "[%{&fileformat}]" [ "blue" "ActiveBg" ] 90 ]
    [ (git_comps.git_branch { :icon "  " }) [ "green" "ActiveBg" ] 90 ]
    [ " " hl_list.Active ]
    basic.right
    [ " " hl_list.Active ]
  ]
  :inactive [
    basic.file_name_inactive
    basic.divider
    basic.divider
    basic.line_col_inactive
    [ "" [ "white" "InactiveBg" ] ]
    basic.progress_inactive
  ]
})

(local quickfix {
  :filetypes [ "qf" "Trouble" ]
  :active [
    [ helper.separators.left_rounded [ "red_light" "black_light" ] ]
    [ "Quickfix " [ "black" "red_light" ] ]
    [ helper.separators.left_rounded [ "black_light" "red_light" ] ]
    [
      #(. (vim.fn.getqflist { :title  0 }) :title)
      [ "cyan" "black_light" ]
    ]
    [ " Total : %L " [ "cyan" "black_light" ] ]
    [ helper.separators.right_rounded [ "black_light" "InactiveBg" ] ]
    [ " " [ "InactiveFg" "InactiveBg" ] ]
    basic.divider
  ]
  :always_active true
})

(local explorer {
  :filetypes [ "fern" "NvimTree" "lir" ]
  :active [
    [ helper.separators.left_rounded [ "black" "black_light" ] ]
    [ "  " [ "white" "black" ] ]
    [ helper.separators.right_rounded [ "black" "black_light" ] ]
    [ b_components.divider "" ]
    [ (b_components.file_name "") [ "white" "black_light" ] ]
  ]
  :always_active true
  :show_last_status true
})

(windline.setup {
  :colors_name (fn [colors]
    ;;-- ADD MORE COLOR HERE ----
    colors)
  :statuslines [
    default
    explorer
    quickfix
    winbar
  ]
  :tabline {
    :template {
      ;; this use a highlight color a text will replace by tab name
      :select [ "" [ "TabSelectionFg" "TabSelectionBg" ] ]
      :select_start [ "" [ "TabLineBg" "TabSelectionBg" ] ]
      :select_end [ (.. sep.slant_right " ") [ "TabSelectionBg" "TabLineBg" ] ]

      ;; select_last display if select tab is a last tab
      :select_last [ sep.slant_right [ "TabSelectionBg" "TabLineFillBg" ] ]

      ;; this only use a highlight color a text will replace by tab name
      :normal [ "" [ "TabLineFg" "TabLineBg" ] ]
      :normal_start [ " " [ "TabLineFg" "TabLineBg" ] ]
      :normal_end [ sep.slant_right_thin [ "TabLineFg" "TabLineBg" ] ]

      ;; normal_select display if a next tab is select
      :normal_select [ (.. sep.slant_right " ") [ "TabLineBg" "TabSelectionBg" ] ]
      ;; normal_last display if tab is the last tab
      :normal_last [ sep.slant_right [ "TabLineBg" "TabLineFillBg" ] ]
    }
  }
})
