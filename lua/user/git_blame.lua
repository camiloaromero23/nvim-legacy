local M = {}

M.config = function()
  vim.g.gitblame_message_template = "      <author>, <date> • <summary>"
  vim.g.gitblame_date_format = "%r"
  vim.g.gitblame_ignored_filetypes = { "NvimTree" }
  vim.g.gitblame_set_extmark_options = {
    hl_mode = "combine",
  }
end

return M
