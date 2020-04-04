nnoremap <leader>ga :Gwrite<CR>
nnoremap <leader>gb :Gblame<CR>
"nnoremap <leader>gm :Gcommit<CR>
nnoremap <leader>gco :Gread<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gw :Gbrowse<CR>
"nnoremap <leader>gan :Git commit --amend --no-edit<CR>
nnoremap <leader>gl :Glog -- %<CR>

nnoremap <C-F> :Ggr <cword><CR>
:command -nargs=+ Ggr execute 'silent Ggrep!' <q-args> | cw | redraw!
