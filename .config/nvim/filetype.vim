augroup filetypedetect
  autocmd BufNewFile,BufRead *.asm,*.inc,*.mac,*.i,*.m,*.S,*.s if !did_filetype() | let &filetype = g:asmsyntax | endif
augroup END
