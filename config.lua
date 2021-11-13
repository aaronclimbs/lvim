-- general
lvim.colorscheme = "tokyonight"
vim.g.tokyonight_style = "night"

lvim.format_on_save = false
lvim.transparent_window = false

vim.opt.wrap = false
lvim.debug = false

vim.o.relativenumber = true

vim.o.pumheight = 25

-- keymappings
lvim.leader = "space"

vim.g.surround_load_keymaps = true
lvim.builtin.notify.active = true

lvim.keys.normal_mode["Y"] = "y$"
lvim.keys.visual_mode["p"] = [["_dP]]
lvim.keys.normal_mode["<esc>"] = [[:nohl<cr>]]

lvim.builtin.treesitter.textsubjects.enable = true

lvim.builtin.treesitter.textobjects = {
  move = {
    enable = true,
    set_jumps = true,

    goto_next_start = {
      ["]m"] = "@function.outer",
      ["]]"] = "@class.outer",
    },
    goto_next_end = {
      ["]M"] = "@function.outer",
      ["]["] = "@class.outer",
    },
    goto_previous_start = {
      ["[m"] = "@function.outer",
      ["[["] = "@class.outer",
    },
    goto_previous_end = {
      ["[M"] = "@function.outer",
      ["[]"] = "@class.outer",
    },
  },

  select = {
    enable = true,

    -- Automatically jump forward to textobj, similar to targets.vim
    lookahead = true,

    keymaps = {
      -- You can use the capture groups defined in textobjects.scm
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner",
    },
  },
}

-- for finding syntax ids for non TS enabled languages
vim.cmd [[
  map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>
]]

-- for neovide
vim.o.guifont = "MesloLGM Nerd Font"
vim.cmd [[
  let g:neovide_cursor_vfx_mode = "railgun"
]]

-- LSP
local formatters = require "lvim.lsp.null-ls.formatters"

formatters.setup {
  {
    exe = "prettier",
    ---@usage specify which filetypes to enable. By default a providers will attach to all filetypes it supports
    filetype = { "typescript", "typescriptreact", "javascript", "javascriptreact", "json", "solidity" },
  },
  {
    exe = "stylua",
    filetype = { "lua" },
  },
}

-- require("user.json_schemas").setup()

-- Builtins
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.dap.active = true
lvim.builtin.bufferline.active = true

-- Whichkey
lvim.builtin.which_key.mappings.l.d = { "<cmd>TroubleToggle<cr>", "Diagnostics" }
lvim.builtin.which_key.mappings.l.R = { "<cmd>TroubleToggle lsp_references<cr>", "References" }
lvim.builtin.which_key.mappings.l.o = { "<cmd>SymbolsOutline<cr>", "Outline" }
lvim.builtin.which_key.mappings.T.h = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Highlight" }
lvim.builtin.which_key.mappings.T.p = { "<cmd>TSPlaygroundToggle<cr>", "Playground" }

lvim.builtin.which_key.mappings["z"] = { "<cmd>ZenMode<cr>", "Zen" }

lvim.builtin.which_key.mappings["r"] = {
  name = "Replace",
  r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
  w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
  f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
}

lvim.builtin.which_key.mappings["u"] = { "<cmd>UndotreeToggle<cr>", "Undotree" }

lvim.builtin.which_key.mappings.s.C = { "<cmd>Telescope colorscheme<cr>", "Colors"}
lvim.builtin.which_key.mappings.s.c = { "<cmd>Telescope commands<cr>", "Commands"}

lvim.builtin.which_key.mappings.s.g = {
  name = "Git",
  s = { "<cmd>Telescope git_status<cr>", "Git status" },
  B = { "<cmd>Telescope git_branches<cr>", "Git branches" },
  c = { "<cmd>Telescope git_commits<cr>", "Git commits" },
  b = { "<cmd>Telescope git_bcommits<cr>", "Git bcommits" },
  t = { "<cmd>Telescope git_stash<cr>", "Git stash" },
}

-- Nvim-tree
lvim.builtin.nvimtree.hide_dotfiles = 0

-- Treesitter
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.playground.enable = true
lvim.builtin.treesitter.indent.disable = { "python" }

-- Telescope
lvim.builtin.telescope.on_config_done = function()
  local actions = require "telescope.actions"
  lvim.builtin.telescope.defaults.mappings = {
    i = {
      ["<C-n>"] = actions.move_selection_next,
      ["<C-p>"] = actions.move_selection_previous,
      ["<C-j>"] = actions.cycle_history_next,
      ["<C-k>"] = actions.cycle_history_prev,
    },
    n = {
      ["<C-n>"] = actions.move_selection_next,
      ["<C-p>"] = actions.move_selection_previous,
    },
  }
  lvim.builtin.telescope.defaults.file_ignore_patterns = { "NvimTree", "node_modules" }
end

lvim.builtin.cmp.sources = {
  { name = "nvim_lsp" },
  { name = "path" },
  { name = "nvim_lua" },
  { name = "emoji" },
  { name = "treesitter" },
}

table.insert(lvim.builtin.cmp.sources, { name = "cmp_git" })

-- Additional Plugins
lvim.plugins = {
  -- { "lunarvim/colorschemes" },
  { "folke/tokyonight.nvim" },
  { "mfussenegger/nvim-jdtls" },
  { "ChristianChiarulli/vim-solidity" },
  { "mattn/emmet-vim" },
  -- {
  --   "abecodes/tabout.nvim",
  --   config = function()
  --     require("user.tabout").config()
  --   end,
  --   wants = { "nvim-treesitter" }, -- or require if not used so far
  --   after = { "nvim-cmp", "LuaSnip" }, -- if a completion plugin is using tabs load it before
  -- },
  {
    "pwntester/octo.nvim",
    event = "BufRead",
    config = function()
      require("user.octo").config()
    end,
  },

  -- {
  --   "ray-x/navigator.lua",
  --   requires = { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
  --   config = function()
  --     require("navigator").setup()
  --   end,
  -- },

  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    config = function()
      require("user.lsp_signature").config()
    end,
  },
  {
    "unblevable/quick-scope",
    config = function()
      require "user.quickscope"
    end,
  },
  {
    "kevinhwang91/rnvimr",
    config = function()
      require "user.rnvimr"
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    -- event = "BufReadPre",
    config = function()
      require "user.blankline"
    end,
  },
  {
    "ruifm/gitlinker.nvim",
    event = "BufRead",
    config = function()
      require("user.gitlinker").config()
    end,
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("user.hop").config()
    end,
  },
  {
    "tamago324/lir.nvim",
    config = function()
      require "user.lir"
    end,
  },
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      require "user.matchup"
    end,
  },
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("user.numb").config()
    end,
  },
  {
    "monaqa/dial.nvim",
    event = "BufRead",
    config = function()
      require("user.dial").config()
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("user.colorizer").config()
    end,
  },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("user.spectre").config()
    end,
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("user.zen").config()
    end,
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("user.neoscroll").config()
    end,
  },
  {
    "mbbill/undotree",
  },
  {
    "simrat39/symbols-outline.nvim",
    -- cmd = "SymbolsOutline",
    config = function()
      require("user.outline").config()
    end,
  },

  -- TODO: maybe oneday
  -- { "gelguy/wilder.nvim",
  --   config = function ()
  --     vim.cmd("source $HOME/.config/lvim/lua/user/wilder.vim")
  --   end
  -- },

  {
    "folke/twilight.nvim",
    config = function()
      require("user.twilight").config()
    end,
    cmd = "ZenMode",
  },
  {
    "blackCauldron7/surround.nvim",
    config = function()
      require("surround").setup {
        context_offset = 100,
        load_autogroups = false,
        mappings_style = "sandwich",
        map_insert_mode = true,
        quotes = { "'", '"', "`" },
        brackets = { "(", "{", "[" },
        pairs = {
          nestable = { { "(", ")" }, { "[", "]" }, { "{", "}" } },
          linear = { { "'", "'" }, { '"', '"' }, { "`", "`" } },
        },
        prefix = "s",
      }
    end,
  },
  -- {
  --   "tzachar/cmp-tabnine",
  --   config = function()
  --     local tabnine = require "cmp_tabnine.config"
  --     tabnine:setup {
  --       max_lines = 1000,
  --       max_num_results = 20,
  --       sort = true,
  --     }
  --   end,

  --   run = "./install.sh",
  --   requires = "hrsh7th/nvim-cmp",
  -- },
  {
    "dccsillag/magma-nvim",
  },
  {
    "metakirby5/codi.vim",
    cmd = "Codi",
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "kevinhwang91/nvim-bqf",
    event = "BufRead",
  },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
  },
  {
    "nvim-treesitter/playground",
    event = "BufRead",
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "wakatime/vim-wakatime",
  },
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup {
        log_level = "info",
        auto_session_suppress_dirs = { "~/", "~/projects" },
      }
    end,
  },
  -- Custom semantic text objects
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  -- Custom semantic text subjects
  {
    "RRethy/nvim-treesitter-textsubjects",
  },
  -- Text objects using hint labels
  {
    "mfussenegger/nvim-ts-hint-textobject",
    after = { "nvim-treesitter" },
    event = "BufRead",
  },
  {
    "petertriho/cmp-git",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("cmp_git").setup()
    end,
  },
}

vim.cmd [[ au CmdWinEnter * quit ]]
-- TODO: q quits in spectr_panel ft
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- O.user_autocommands = {{ "BufWinEnter", "*", "echo \"hi again\""}}

-- way to get os name
-- print(vim.loop.os_uname().sysname)

-- *Must* be *S*olidity not solidity
require("nvim-treesitter.parsers").get_parser_configs().solidity = {
  install_info = {
    url = "https://github.com/JoranHonig/tree-sitter-solidity",
    files = { "src/parser.c" },
    requires_generate_from_grammar = true,
  },
  filetype = "solidity",
}
