# Neovim Keybinds

Leader key: `<Space>`

## General

| Key | Mode | Action |
|-----|------|--------|
| `<leader>?` | n | This cheatsheet |
| `<leader>f` | n/v | Format buffer |
| `<leader>y` | n/v | Copy to system clipboard |
| `<C-h/j/k/l>` | n | Move between splits |

## Flash (jump)

| Key | Mode | Action |
|-----|------|--------|
| `s` | n/x/o | Jump to position (2-char search) |
| `S` | n/x/o | Jump to treesitter node |
| `r` | o | Remote — operate on distant text without moving |
| `R` | o/x | Treesitter search |

## Aerial (symbol outline)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>o` | n | Toggle symbol outline |
| `[[` / `]]` | n | Prev/next symbol |

## Undotree

| Key | Mode | Action |
|-----|------|--------|
| `<leader>u` | n | Toggle undo history tree |

## Trouble (diagnostics)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>xx` | n | Buffer diagnostics |
| `<leader>xX` | n | Workspace diagnostics |
| `<leader>xq` | n | Quickfix list |

## Harpoon (file pinning)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>a` | n | Pin current file |
| `<C-e>` | n | Open pin menu |
| `<C-1>` – `<C-4>` | n | Jump to pinned file 1–4 |

## File Tree (Neo-tree)

| Key | Mode | Action |
|-----|------|--------|
| `\` | n | Reveal current file in tree |
| `<leader>e` | n | Toggle file tree |
| `<leader>b` | n | Toggle buffer list |
| `<leader>gs` | n | Git status (float) |

## Telescope (Search)

| Key | Mode | Action |
|-----|------|--------|
| `<leader><leader>` | n | Open buffers |
| `<leader>sf` | n | Find files |
| `<leader>sg` | n | Live grep |
| `<leader>sw` | n | Search word under cursor |
| `<leader>sr` | n | Resume last search |
| `<leader>s.` | n | Recent files |
| `<leader>sd` | n | Search diagnostics |
| `<leader>sn` | n | Search nvim config files |
| `<leader>sR` | n | Search ~/repos/ |
| `<leader>/` | n | Fuzzy search current buffer |
| `<leader>s/` | n | Search in open files |

## LSP

| Key | Mode | Action |
|-----|------|--------|
| `grd` | n | Go to definition |
| `grr` | n | Go to references |
| `gri` | n | Go to implementation |
| `grt` | n | Go to type definition |
| `grD` | n | Go to declaration |
| `grn` | n | Rename symbol |
| `gra` | n/x | Code action |
| `gO` | n | Document symbols |
| `gW` | n | Workspace symbols |
| `<leader>th` | n | Toggle inlay hints |
| `<leader>q` | n | Diagnostics to quickfix |
| `<leader>ss` | n | C/C++: Switch source/header |

## Git (Gitsigns)

| Key | Mode | Action |
|-----|------|--------|
| `]c` / `[c` | n | Next/prev git change |
| `<leader>hs` | n/v | Stage hunk |
| `<leader>hr` | n/v | Reset hunk |
| `<leader>hS` | n | Stage buffer |
| `<leader>hR` | n | Reset buffer |
| `<leader>hp` | n | Preview hunk |
| `<leader>hb` | n | Blame line |
| `<leader>hd` | n | Diff against index |
| `<leader>hD` | n | Diff against last commit |
| `<leader>tb` | n | Toggle blame |
| `<leader>tw` | n | Toggle word diff |
| `ih` | o/x | Select hunk (text object) |

## Completion (blink-cmp)

| Key | Action |
|-----|--------|
| `<C-n>` / `<C-p>` | Next/prev suggestion |
| `<C-y>` / `<Enter>` | Accept |
| `<C-b>` / `<C-f>` | Scroll docs up/down |
