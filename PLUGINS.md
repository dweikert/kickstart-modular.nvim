# Plugin Usage Reference

## flash.nvim — jump anywhere on screen

Type `s` then 2 characters of your target. Flash highlights matching positions with labels — press the label key to jump.

| Key | Mode | Action |
|-----|------|--------|
| `s` | n/x/o | Jump to any position (2-char search) |
| `S` | n/x/o | Jump using treesitter nodes |
| `r` | o | Remote — apply operator on a distant location without moving cursor |
| `R` | o/x | Treesitter search across file |
| `<C-s>` | c | Toggle flash labels while using `/` search |

**Examples:**
- `ysw` then `s` + 2 chars → surround a distant word without moving there first
- `d` then `r` + 2 chars → delete text at another location, cursor stays put
- `S` → jump to a function argument, if/else block, etc. by treesitter node

---

## mini.surround — surround text with brackets/quotes

Default operator: `s` (followed by action and target)

| Key | Action | Example |
|-----|--------|---------|
| `sa{motion}{char}` | Add surrounding | `saiw)` → surround inner word with `()` |
| `sd{char}` | Delete surrounding | `sd'` → remove `'...'` quotes |
| `sr{old}{new}` | Replace surrounding | `sr)"` → change `()` to `""` |
| `sf{char}` | Find surrounding (right) | `sf)` → move cursor to next `)` |
| `sF{char}` | Find surrounding (left) | |
| `sh{char}` | Highlight surrounding | |

**Common chars:** `)` `]` `}` `'` `"` `` ` `` `t` (HTML tag)

**Examples:**
- `saip}` → surround paragraph with `{}`
- `sdt` → delete surrounding HTML tag
- `sr'"` → change `'hello'` to `"hello"`

---

## mini.ai — extended text objects

Extends `a`/`i` with more targets. Works with any operator (`d`, `c`, `y`, `v`).

| Object | Meaning |
|--------|---------|
| `a)` / `i)` | Around/inside parentheses (also `b`) |
| `a]` / `i]` | Around/inside brackets |
| `a}` / `i}` | Around/inside braces |
| `a'` / `i'` | Around/inside single quotes |
| `a"` / `i"` | Around/inside double quotes |
| `a`` ` / `i`` ` | Around/inside backticks |
| `at` / `it` | Around/inside HTML tag |
| `af` / `if` | Around/inside function call |
| `aa` / `ia` | Around/inside argument |

**Supports `n`/`l` modifiers for next/last:**
- `cin)` → change inside **next** parentheses
- `dal]` → delete around **last** brackets

---

## undotree — visualize undo history

Open with `<leader>u`. Nvim persists full undo history across sessions (`undofile = true`).

- Navigate the tree with `j`/`k`
- `<CR>` to jump to that state
- `p` to preview diff at cursor
- `q` or `<leader>u` to close

Useful when you've undone too much and want to recover a specific earlier state.

---

## aerial.nvim — symbol outline

Open with `<leader>o`. Shows all symbols (functions, classes, methods) in a sidebar.

| Key | Action |
|-----|--------|
| `<leader>o` | Toggle outline sidebar |
| `[[` / `]]` | Jump to prev/next symbol from any buffer |
| `<CR>` | Jump to symbol (in aerial window) |
| `q` | Close aerial |
| `zA` | Toggle fold |

---

## trouble.nvim — diagnostics panel

Replaces the default quickfix/loclist with a structured panel.

| Key | Action |
|-----|--------|
| `<leader>xx` | Buffer diagnostics |
| `<leader>xX` | Workspace diagnostics |
| `<leader>xq` | Quickfix list |
| `j`/`k` | Navigate items |
| `<CR>` | Jump to location |
| `q` | Close |

Use `<leader>xX` after `grr` (references) or `gri` (implementations) to browse results in trouble instead of the quickfix.
