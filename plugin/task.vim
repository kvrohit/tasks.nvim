if exists('g:loaded_tasks') | finish | endif " prevent loading file twice

let s:save_cpo = &cpo
set cpo&vim

" load tasks lua
command! ToggleTask lua require'task'.tasks()

let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_tasks = 1
