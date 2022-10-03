vim.g.gitblame_enabled = 0
vim.g.gitblame_message_template = "<summary> • <date> • <author>"
vim.g.gitblame_highlight_group = "LineNr"

lvim.builtin.gitsigns.opts = {
  signs = {
    add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = {
      hl = "GitSignsChange",
      text = "▎",
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn",
    },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter_opts = {
    relative_time = false,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  yadm = {
    enable = true,
  },
  keymaps = {
    -- Text Objects
    ["o ih"] = ":<C-U>Gitsigns select_hunk<CR>",
    ["x ih"] = ":<C-U>Gitsigns select_hunk<CR>",
  },
}

local M = {}

M.config = function()
  local status_ok, gitlinker = pcall(require, "gitlinker")
  if not status_ok then
    return
  end

  gitlinker.setup({
    opts = {
      callbacks = {
        ["github.com"] = function(url_data)
          url_data["host"] = url_data.host:gsub("-sl", ""):gsub("-me", "")
          local baseUrl = require("gitlinker.hosts").get_base_https_url(url_data)
          local url = baseUrl .. "/blob/" .. url_data.rev .. "/" .. url_data.file
          if url_data.lstart then
            url = url .. "#L" .. url_data.lstart
            if url_data.lend then
              url = url .. "-L" .. url_data.lend
            end
          end
          return url
        end,
      },
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
  })
end

return M
