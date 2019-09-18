augroup filetypedetect
  autocmd BufNewFile,BufRead *.asm,*.inc,*.mac,*.i,*.m,*.S,*.s if !did_filetype() | let &filetype = g:asmsyntax | endif
  autocmd BufNewFile,BufRead .yamllint,~/.config/yamllint/config setfiletype yaml
augroup END
