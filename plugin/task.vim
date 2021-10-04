" prevent loading file twice
if exists('g:loaded_tasks') | finish | endif

let s:save_cpo = &cpo
set cpo&vim

" load tasks lua
command! ToggleTask lua require('task').toggle()
command! UndoTask lua require('task').undo()
command! CancelTask lua require('task').cancel()

let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_tasks = 1
