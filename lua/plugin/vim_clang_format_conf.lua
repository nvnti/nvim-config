----------------------------
--
-------------------------------
return {
  "rhysd/vim-clang-format",
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
