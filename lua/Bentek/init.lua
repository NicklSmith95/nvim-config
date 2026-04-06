require("Bentek.remap")
require("Bentek.set")
require("Bentek.db_keymaps")
vim.diagnostic.config({
  -- Show virtual text (inline messages)
  virtual_text = true,
  -- Show signs in the sign column
  signs = true,
  -- Underline errors
  underline = true,
  -- Update diagnostics in insert mode
  update_in_insert = false, -- or true if you prefer
  -- Severity sort for diagnostics
  severity_sort = true,
})
