local M = {}

M.config = function()
  local status_ok, gitlinker = pcall(require, "gitlinker")
  if not status_ok then
    return
  end
  lvim.builtin.which_key.mappings["gy"] = "Copy link to file"
  lvim.builtin.which_key.mappings["gY"] = { "<cmd>lua require'gitlinker'.get_repo_url()<cr>", "Copy link to repo" }
  gitlinker.setup {
    opts = {
      -- remote = 'github', -- force the use of a specific remote
      -- adds current line nr in the url for normal mode
      add_current_line_on_normal_mode = true,
      -- callback for what to do with the url
      action_callback = require("gitlinker.actions").copy_to_clipboard,
      -- print the url after performing the action
      print_url = false,
      -- mapping to call url generation
      mappings = "<leader>gy",
    },
    callbacks = {
      ["git.comcast.com"] = require("gitlinker.hosts").get_github_type_url,
      ["gitlab.spectrumflow.net"] = require("gitlinker.hosts").get_gitlab_type_url,
    },
  }
end

return M
