" C# Settings
autocmd BufNewFile,BufReadPost *.cs setl ts=4 sw=4 sts=4 expandtab

" =================== omnisharp-vim ========================

let g:OmniSharp_server_stdio = 1
let g:OmniSharp_selector_ui = 'fzf'
let g:ale_linters = { 'cs': ['OmniSharp'] }
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_list_window_size = 5
let g:OmniSharp_want_snippet = 1
let g:OmniSharp_edit_command = 'vsplit'
let g:OmniSharp_highlight_groups = {
\ 'ExcludedCode': 'NonText',
\ 'ClassName': 'Typedef',
\ 'StructName': 'Typedef',
\ 'DelegateName': 'Structure',
\ 'EnumName': 'Structure',
\ 'InterfaceName': 'Structure',
\ 'ModuleName': 'Structure',
\ 'NamespaceName': 'Include',
\ 'RegexComment': 'Comment',
\ 'RegexCharacterClass': 'Character',
\ 'RegexAnchor': 'Type',
\ 'RegexQuantifier': 'Number',
\ 'RegexGrouping': 'Macro',
\ 'RegexAlternation': 'Identifier',
\ 'RegexText': 'String',
\ 'RegexSelfEscapedCharacter': 'Delimiter',
\ 'RegexOtherEscape': 'Delimiter'
\}

augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving
  autocmd CursorHold *.cs OmniSharpTypeLookup
  autocmd BufWritePost *.cs silent :call OmniSharp#CodeFormat()

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>fu <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> <Leader>fi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>tt <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> K <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> <Leader>fs <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <Leader>fx <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

  " Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [m <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]m <Plug>(omnisharp_navigate_down)
  " Find all code errors/warnings for the current solution and populate the quickfix window
  autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)
  " Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ca <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader>ca <Plug>(omnisharp_code_actions)
  " Repeat the last code action performed (does not use a selector)
  autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
  autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)

  autocmd FileType cs nmap <silent> <buffer> <Leader>cf <Plug>(omnisharp_code_format)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osnm <Plug>(omnisharp_rename)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
augroup END

" Add syntax highlighting for types and interfaces
nmap <Leader>th :OmniSharpHighlightTypes<CR>

" XML documentation
nnoremap /// :call AngelDoc#InsertXmlDoc()<CR>
