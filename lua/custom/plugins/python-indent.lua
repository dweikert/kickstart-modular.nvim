-- PEP8/black-correct Python indentation.
--
-- Replaces vim's built-in python#GetIndent, which over-indents hanging continuations
-- (12 spaces where black wants 8). Treesitter's indent query is worse still -- it de-indents
-- `obs[:, 0]` inside an open call, because `indentkeys` contains `<:>` so every typed colon
-- re-runs indentexpr on a half-typed, unparseable line. Treesitter indent is disabled for
-- python in lua/kickstart/plugins/treesitter.lua; this fills the slot.
return {
  'Vimjas/vim-python-pep8-indent',
  ft = 'python',
}
