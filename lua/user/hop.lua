local M = {}

M.config = function()
  local status_ok, hop = pcall(require, "hop")
  if not status_ok then
    return
  end
  hop.setup()
  vim.api.nvim_set_keymap("", "m", ":HopChar2<cr>", { silent = true })
  vim.api.nvim_set_keymap("", "S", ":HopWord<cr>", { silent = true })
end

return M
