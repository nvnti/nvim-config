local M = {}

function M.fn()
  vim.g["clang_format#style_options"] = {
    AccessModifierOffset = -4,
    AllowShortIfStatementsOnASingleLine = true,
    AlwaysBreakTemplateDeclarations = true,
    BreakStringLiterals = false,
    ColumnLimit = 80,
    Standard = "C++11",
  }
end

return M
