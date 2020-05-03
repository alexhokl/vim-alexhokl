set clipboard+=unnamedplus

set undofile

set suffixesadd=.cs,.csproj,.go,.md

set inccommand=nosplit

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

noremap <PageUp> <NOP>
noremap <PageDown> <NOP>
inoremap <PageUp> <NOP>
inoremap <PageDown> <NOP>

nnoremap <leader>e :exe getline(line('.'))<cr>

" resize buffer
noremap <silent> <leader><Up> :resize +5<cr>
noremap <silent> <leader><Down> :resize -5<cr>
noremap <silent> <leader><Left> :vertical resize -5<cr>
noremap <silent> <leader><Right> :vertical resize +5<cr>
