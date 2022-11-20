-- Additional Plugins
local packer = require "packer"

packer.init {
  max_jobs = 30,
  git = {
    clone_timeout = 300, -- 5 mins
  },
}

lvim.plugins = {
  "ellisonleao/gruvbox.nvim",
  "nvim-treesitter/playground",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "p00f/nvim-ts-rainbow",
  "mfussenegger/nvim-jdtls",
  "karb94/neoscroll.nvim",
  "christoomey/vim-tmux-navigator",
  "j-hui/fidget.nvim",
  "windwp/nvim-ts-autotag",
  "kylechui/nvim-surround",
  "christianchiarulli/harpoon",
  "MattesGroeger/vim-bookmarks",
  "NvChad/nvim-colorizer.lua",
  "ghillb/cybu.nvim",
  "moll/vim-bbye",
  "folke/todo-comments.nvim",
  "windwp/nvim-spectre",
  "f-person/git-blame.nvim",
  "ruifm/gitlinker.nvim",
  "jeffkreeftmeijer/vim-numbertoggle",
  "mattn/vim-gist",
  "mattn/webapi-vim",
  "folke/zen-mode.nvim",
  "lvimuser/lsp-inlayhints.nvim",
  "lunarvim/darkplus.nvim",
  "lunarvim/templeos.nvim",
  "kevinhwang91/nvim-bqf",
  "is0n/jaq-nvim",
  "hrsh7th/cmp-emoji",
  "ggandor/leap.nvim",
  "nacro90/numb.nvim",
  "TimUntersberger/neogit",
  "sindrets/diffview.nvim",
  "simrat39/rust-tools.nvim",
  "olexsmir/gopher.nvim",
  "leoluz/nvim-dap-go",
  "mfussenegger/nvim-dap-python",
  "jose-elias-alvarez/typescript.nvim",
  "mxsdev/nvim-dap-vscode-js",
  "petertriho/nvim-scrollbar",
  {
    "saecki/crates.nvim",
    tag = "v0.3.0",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup {
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      }
    end,
  },
  {
    "jinh0/eyeliner.nvim",
    config = function()
      require("eyeliner").setup {
        highlight_on_key = true,
      }
    end,
  },
  { "christianchiarulli/telescope-tabs", branch = "chris" },
  "monaqa/dial.nvim",
  {
    "0x100101/lab.nvim",
    run = "cd js && npm ci",
  },
  { "tzachar/cmp-tabnine", run = "./install.sh" },
  {
    "zbirenbaum/copilot.lua",
    -- event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup {
          plugin_manager_path = os.getenv "LUNARVIM_RUNTIME_DIR" .. "/site/pack/packer",
          suggestion = {
            enabled = true,
            auto_trigger = false,
            debounce = 75,
            keymap = {
              accept = "<C-tab>",
              dismiss = "<C-]>",
            },
          },
        }
      end, 100)
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup {
        formatters = {
          insert_text = require("copilot_cmp.format").remove_existing,
        },
      }
    end,
  },
  -- "MunifTanjim/nui.nvim",
  -- {
  --   "folke/noice.nvim",
  --   event = "VimEnter",
  --   config = function()
  --     require("noice").setup()
  --   end,
  -- },

  "tpope/vim-unimpaired",
  "tpope/vim-repeat",

  {
    "rmagatti/session-lens",
    requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
    config = function()
      require("session-lens").setup {
        theme_conf = { border = false },
        previewer = true,
      }
    end,
  },
  { "simrat39/symbols-outline.nvim" },

  "tpope/vim-unimpaired",
  "tpope/vim-repeat",

  {
    "rmagatti/session-lens",
    requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
    config = function()
      require("session-lens").setup {
        theme_conf = { border = false },
        previewer = true,
      }
    end,
  },
  { "simrat39/symbols-outline.nvim" },

  -- https://github.com/jose-elias-alvarez/typescript.nvim

  {
    "rmagatti/igs.nvim",
    config = function()
      require("igs").setup {}
    end,
  },

  -- "MunifTanjim/nui.nvim",
  -- "rcarriga/nvim-notify",
  -- {
  --   "folke/noice.nvim",
  --   event = "VimEnter",
  --   config = function()
  --     require("noice").setup({})
  --   end,
  -- },
  {
    "cbochs/portal.nvim",
    config = function()
      require("portal").setup {
        -- Your configuration goes here
        -- Leave empty to use the default configuration
        -- Please see the Configuration section below for more information
        integrations = {
          grapple = true,
          harpoon = true,
        },
      }
    end,
    requires = {
      "cbochs/grapple.nvim", -- Optional: provides the "grapple" query item
    },
  },
  {
    "pwntester/octo.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("octo").setup()
    end,
  },
  "rhysd/conflict-marker.vim",
  "ibhagwan/smartyank.nvim",
  {
    "epwalsh/obsidian.nvim",
    config = function()
      require("obsidian").setup {
        dir = "~/Documents/devbook",
        notes_subdir = "notes",
        daily_notes = {
          folder = "daily",
        },
      }
    end,
  },
}

require("leap").add_default_mappings()
require("smartyank").setup {
  highlight = {
    timeout = 400, -- timeout for clearing the highlight
  },
}
