if exists('g:loaded_tasks') | finish | endif " prevent loading file twice

let s:save_cpo = &cpo
set cpo&vim

" load tasks lua
command! ToggleTask lua require'task'.tasks()
command! UndoTask lua require'task'.undo()
command! CancelTask lua require'task'.cancel()

let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_tasks = 1
