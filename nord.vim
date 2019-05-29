function! crystalline#theme#nord#set_theme() abort
  call crystalline#generate_theme({
        \ 'NormalMode': [[0, 6], ['#3B4252', '#88C0D0']],
        \ 'InsertMode': [[0, 15], ['#3B4252', '#A3BE8C']],
        \ 'VisualMode': [[0, 14], ['#3B4252', '#8FBCBB']],
        \ 'ReplaceMode': [[0, 2], ['#3B4252', '#A3BE8C']],
        \ '': [[0, 4], ['#3B4252', '#81A1C1']],
        \ 'Inactive': [[7, 8], ['#E5E9F0', '#4C566A']],
        \ 'Fill': [[7, 8], ['#E5E9F0', '#4C566A']],
        \ 'Tab': [[0, 4], ['#3B4252', '#81A1C1']],
        \ 'TabType': [[0, 14], ['#3B4252', '#8FBCBB']],
        \ 'TabSel': [[0, 6], ['#3B4252', '#88C0D0']],
        \ 'TabFill': [[7, 8], ['#E5E9F0', '#4C566A']],
        \ })
endfunction
" vim:set et sw=2 ts=2 fdm=marker:
