function! AddMarkdownHeader(level)
	:let l:readyForInsert = "normal! m9I"
	:let l:spaceAndReturnToOriginalPosition = "\<space>\<esc>`9"
	:let l:header = repeat("#", a:level)
	:let l:adjustment = repeat("l", a:level + 1)
	:execute join([l:readyForInsert, l:header, l:spaceAndReturnToOriginalPosition, l:adjustment], "")
endfunction

function! AddCodeBlock(languageType)
	:let l:readyForInsert = "normal! I```"
	:let l:finish = "\<cr>\<cr>```\<esc>k"
	:execute join([l:readyForInsert, a:languageType, l:finish], "")
endfunction

function! AddKeyboardKeyAnnotation()
	:let l:prepare = "normal! a<kbd></kbd>\<esc>F>"
	:execute join([l:prepare], "")
endfunction

nnoremap <leader>h1 :call AddMarkdownHeader(1)<CR>
nnoremap <leader>h2 :call AddMarkdownHeader(2)<CR>
nnoremap <leader>h3 :call AddMarkdownHeader(3)<CR>
nnoremap <leader>h4 :call AddMarkdownHeader(4)<CR>
nnoremap <leader>h5 :call AddMarkdownHeader(5)<CR>
nnoremap <leader>h6 :call AddMarkdownHeader(6)<CR>

nnoremap <leader>sh :call AddCodeBlock("sh")<cr>
nnoremap <leader>yaml :call AddCodeBlock("yaml")<cr>
nnoremap <leader>js :call AddCodeBlock("js")<cr>
nnoremap <leader>csharp :call AddCodeBlock("csharp")<cr>
nnoremap <leader>go :call AddCodeBlock("go")<cr>

nnoremap <leader>kbd :call AddKeyboardKeyAnnotation()<cr>

let g:vim_markdown_conceal_code_blocks = 0

" latex math
let g:tex_conceal = ""
let g:vim_markdown_math = 1

"indentation
let g:vim_markdown_new_list_item_indent = 2

" attempt to fix problem - pattern uses more memory than 'maxmempattern'
" the default is 1000
set mmp=5000
