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

## Mini Surround — Surrounding Characters

| Character | Result |
|-----------|--------|
| `)` or `b` | `(text)` — no spaces |
| `(` | `( text )` — with spaces |
| `]` | `[text]` — no spaces |
| `[` | `[ text ]` — with spaces |
| `}` or `B` | `{text}` — no spaces |
| `{` | `{ text }` — with spaces |
| `>` | `<text>` — no spaces |
| `<` | `< text >` — with spaces |
| `'` | `'text'` |
| `"` | `"text"` |
| `` ` `` | `` `text` `` |
| `t` | `<tag>text</tag>` — tag name prompted |
| `f` | `name(text)` — function name prompted |

## Mini Surround — Add (sa)

| Key | Mode | Action |
|-----|------|--------|
| `saiw)` | n | Surround inner word with `()` |
| `saiw(` | n | Surround inner word with `( )` (spaces inside) |
| `saiw"` | n | Surround inner word with `""` |
| `saiw'` | n | Surround inner word with `''` |
| ``saiw` `` | n | Surround inner word with backticks |
| `saiw]` | n | Surround inner word with `[]` |
| `saiw}` | n | Surround inner word with `{}` |
| `saiw>` | n | Surround inner word with `<>` |
| `saiWt` | n | Surround inner WORD with HTML tag (prompted) |
| `saiWf` | n | Surround inner WORD with function call (prompted) |
| `saaw)` | n | Surround around word (incl. trailing space) with `()` |
| `sa2w)` | n | Surround next 2 words with `()` |
| `sa$"` | n | Surround to end of line with `""` |
| `sae"` | n | Surround to end of word with `""` |
| `saip)` | n | Surround inner paragraph with `()` |
| `saap)` | n | Surround around paragraph with `()` |
| `sais)` | n | Surround inner sentence with `()` |
| `sai')` | n | Surround contents of `''` with `()` |
| `sai")` | n | Surround contents of `""` with `()` |
| ``sai`)`` | n | Surround contents of backticks with `()` |
| `sai))` | n | Surround contents of `()` with `()` |
| `sai])` | n | Surround contents of `[]` with `()` |
| `sai})` | n | Surround contents of `{}` with `()` |
| `sait)` | n | Surround inner tag contents with `()` |
| `saif)` | n | Surround inner function args with `()` |
| `sa2j)` | n | Surround current + next 2 lines with `()` |
| `sa)` | x | Surround selection with `()` |
| `sa"` | x | Surround selection with `""` |
| `sa'` | x | Surround selection with `''` |
| ``sa` `` | x | Surround selection with backticks |
| `sa]` | x | Surround selection with `[]` |
| `sa}` | x | Surround selection with `{}` |
| `sa>` | x | Surround selection with `<>` |
| `sat` | x | Surround selection with HTML tag (prompted) |
| `saf` | x | Surround selection with function call (prompted) |

## Mini Surround — Delete (sd)

| Key | Mode | Action |
|-----|------|--------|
| `sd)` | n | Delete surrounding `()` |
| `sd(` | n | Delete surrounding `( )` (with spaces) |
| `sd"` | n | Delete surrounding `""` |
| `sd'` | n | Delete surrounding `''` |
| ``sd` `` | n | Delete surrounding backticks |
| `sd]` | n | Delete surrounding `[]` |
| `sd[` | n | Delete surrounding `[ ]` (with spaces) |
| `sd}` | n | Delete surrounding `{}` |
| `sd{` | n | Delete surrounding `{ }` (with spaces) |
| `sd>` | n | Delete surrounding `<>` |
| `sdt` | n | Delete surrounding HTML tag |
| `sdf` | n | Delete surrounding function call parens |

## Mini Surround — Replace (sr)

| Key | Mode | Action |
|-----|------|--------|
| `sr)"` | n | Replace `()` with `""` |
| `sr)'` | n | Replace `()` with `''` |
| ``sr)` `` | n | Replace `()` with backticks |
| `sr])` | n | Replace `[]` with `()` |
| `sr})` | n | Replace `{}` with `()` |
| `sr>)` | n | Replace `<>` with `()` |
| `sr"'` | n | Replace `""` with `''` |
| `sr'"` | n | Replace `''` with `""` |
| ``sr"` `` | n | Replace `""` with backticks |
| `srt)` | n | Replace HTML tag with `()` |
| `srt"` | n | Replace HTML tag with `""` |
| `sr)t` | n | Replace `()` with HTML tag (prompted) |
| `sr"t` | n | Replace `""` with HTML tag (prompted) |
| `sr)f` | n | Replace `()` with function call (prompted) |
| `srf)` | n | Replace function call parens with `()` |
| `srtt` | n | Replace HTML tag with different tag (prompted) |
| `srff` | n | Replace function name (prompted) |

## Mini Surround — Find & Highlight

| Key | Mode | Action |
|-----|------|--------|
| `sf)` | n | Jump to next `()` surrounding (rightward) |
| `sF)` | n | Jump to next `()` surrounding (leftward) |
| `sf"` | n | Jump to next `""` surrounding (rightward) |
| `sF"` | n | Jump to next `""` surrounding (leftward) |
| `sf'` | n | Jump to next `''` surrounding (rightward) |
| `sF'` | n | Jump to next `''` surrounding (leftward) |
| ``sf` `` | n | Jump to next backtick surrounding (rightward) |
| `sf]` | n | Jump to next `[]` surrounding (rightward) |
| `sf}` | n | Jump to next `{}` surrounding (rightward) |
| `sft` | n | Jump to next HTML tag (rightward) |
| `sFt` | n | Jump to next HTML tag (leftward) |
| `sff` | n | Jump to next function call surrounding (rightward) |
| `sh)` | n | Highlight surrounding `()` |
| `sh"` | n | Highlight surrounding `""` |
| `sh'` | n | Highlight surrounding `''` |
| `sh]` | n | Highlight surrounding `[]` |
| `sh}` | n | Highlight surrounding `{}` |
| `sht` | n | Highlight surrounding HTML tag |
| `shf` | n | Highlight surrounding function call |
| `sn` | n | Update n_lines (expand search range for surroundings) |

## Completion (blink-cmp)

| Key | Action |
|-----|--------|
| `<C-n>` / `<C-p>` | Next/prev suggestion |
| `<C-y>` / `<Enter>` | Accept |
| `<C-b>` / `<C-f>` | Scroll docs up/down |
