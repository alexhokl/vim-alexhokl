" auto-format code and add missing imports
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

