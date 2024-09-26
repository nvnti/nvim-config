----------------
-- Clang rust format
----------------
return {
  "rhysd/vim-clang-format", -- NOt really a dependency but should work
  enabled = function()
    return not vim.opt.diff:get()
  end,
  config = function()
    vim.g["clang_format#style_options"] = {
      AccessModifierOffset = -4,
      AllowShortIfStatementsOnASingleLine = true,
      AlwaysBreakTemplateDeclarations = true,
      BreakStringLiterals = false,
      ColumnLimit = 80,
      Standard = "C++11",
    }
  end,
}
