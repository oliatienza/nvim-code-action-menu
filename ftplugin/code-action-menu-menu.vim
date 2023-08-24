runtime! ftplugin/code-action-menu.vim ftplugin/code-action-menu_*.vim ftplugin/code-action-menu/*.vim

nnoremap <buffer> <CR> <cmd>lua require('code_action_menu').execute_selected_action()<CR>
nnoremap <buffer> 1 <cmd>lua require('code_action_menu').select_line_and_execute_action(1)<CR>
nnoremap <buffer> 2 <cmd>lua require('code_action_menu').select_line_and_execute_action(2)<CR>
nnoremap <buffer> 3 <cmd>lua require('code_action_menu').select_line_and_execute_action(3)<CR>
nnoremap <buffer> 4 <cmd>lua require('code_action_menu').select_line_and_execute_action(4)<CR>
nnoremap <buffer> 5 <cmd>lua require('code_action_menu').select_line_and_execute_action(5)<CR>
nnoremap <buffer> 6 <cmd>lua require('code_action_menu').select_line_and_execute_action(6)<CR>
nnoremap <buffer> 7 <cmd>lua require('code_action_menu').select_line_and_execute_action(7)<CR>
nnoremap <buffer> 8 <cmd>lua require('code_action_menu').select_line_and_execute_action(8)<CR>
nnoremap <buffer> 9 <cmd>lua require('code_action_menu').select_line_and_execute_action(9)<CR>
nnoremap <buffer> 0 <cmd>lua require('code_action_menu').select_line_and_execute_action(10)<CR>
nnoremap <buffer> q <cmd>lua require('code_action_menu').select_line_and_execute_action(11)<CR>
nnoremap <buffer> w <cmd>lua require('code_action_menu').select_line_and_execute_action(12)<CR>
nnoremap <buffer> e <cmd>lua require('code_action_menu').select_line_and_execute_action(13)<CR>
nnoremap <buffer> r <cmd>lua require('code_action_menu').select_line_and_execute_action(14)<CR>
nnoremap <buffer> t <cmd>lua require('code_action_menu').select_line_and_execute_action(15)<CR>
nnoremap <buffer> y <cmd>lua require('code_action_menu').select_line_and_execute_action(16)<CR>
nnoremap <buffer> u <cmd>lua require('code_action_menu').select_line_and_execute_action(17)<CR>
nnoremap <buffer> i <cmd>lua require('code_action_menu').select_line_and_execute_action(18)<CR>
nnoremap <buffer> o <cmd>lua require('code_action_menu').select_line_and_execute_action(19)<CR>
nnoremap <buffer> <Esc> <cmd>lua require('code_action_menu').close_code_action_menu()<CR>
nnoremap <buffer> q <cmd>lua require('code_action_menu').close_code_action_menu()<CR>

" Fixes awkward visual selection (is it?) for range code actions.
" Do this before the CursorMoved auto-command.
call feedkeys('jk')

augroup CodeActionMenuMenu
  autocmd!
  autocmd CursorMoved <buffer> lua require('code_action_menu').update_selected_action()
  autocmd User CodeActionMenuWindowOpened ++once setlocal scrolloff=0
  autocmd User CodeActionMenuWindowOpened ++once setlocal cursorline
  autocmd User CodeActionMenuWindowOpened ++once setlocal winhighlight=CursorLine:CodeActionMenuMenuSelection
augroup END
