----------------------------
--
-------------------------------
return {
  "nvnti/AbbrevMan.nvim",
  config = function()
    require("abbrev-man").setup({
      load_natural_dictionaries_at_startup = true,
      load_programming_dictionaries_at_startup = true,
      natural_dictionaries = {
        ["nt_en"] = {},
      },
      programming_dictionaries = {
        ["pr_py"] = {},
      },
    })
  end,
}
