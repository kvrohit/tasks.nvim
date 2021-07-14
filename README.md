# Neovim Tasks

A simple extension for Neovim to organize your to-do lists.

## Installation 

```vim
<PackageManager> 'kvrohit/tasks.nvim'
```

## How to use

Create a file and save with `todo` extension.

To toggle text as a todo item use the `:ToggleTask` command. Running this command on an empty line will convert that line into a todo item.

Running `:ToggleTask` on a todo item will toggle its state from open to complete and vice versa.

To unmark a todo item run `:UndoTask`.

Setup custom shortcuts/keybindings in your configuration for ease of use. Example:

```vim
nnoremap <leader>tt :ToggleTask<CR>
nnoremap <leader>td :UndoTask<CR>
```

## Example

```
✔ Implement the tasks plugin for Neovim @done (03/07/2020 22:33:06)
☐ Write usage documentation for the tasks plugin
```
