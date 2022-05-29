local M = {}

M.config = function()
  local status_ok, rainbow = pcall(require, "nvim-treesitter.configs")
  if not status_ok then
    return
  end

  -- vim.cmd [[hi rainbowcol1 guifg=Gold]]
  -- vim.cmd [[hi rainbowcol2 guifg=Orchid]]
  -- vim.cmd [[hi rainbowcol3 guifg=LightSkyBlue]]
  rainbow.setup {
    rainbow = {
      enable = true,
      extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = 5000, -- Do not enable for files with more than n lines, int
      colors = {
        "Gold",
        "Orchid",
        "LightSkyBlue",
      }, -- table of hex strings
      -- termcolors = {
      --   "rainbowcol1",
      --   "rainbowcol2",
      --   "rainbowcol3",
      -- }, -- table of colour name strings
    },
  }
end

return M
