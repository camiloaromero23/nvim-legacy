local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  autotag = {
    enable = true,
    disable = { "" },
  },
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

  indent = { enable = true, disable = { "yaml" } },
}
