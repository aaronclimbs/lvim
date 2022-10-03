-- Additional Plugins
lvim.plugins = {
  "karb94/neoscroll.nvim",
  "christianchiarulli/harpoon",
  "MattesGroeger/vim-bookmarks",
  "NvChad/nvim-colorizer.lua",
  "ghillb/cybu.nvim",
  "moll/vim-bbye",
  "folke/todo-comments.nvim",
  "windwp/nvim-spectre",
  "is0n/jaq-nvim",
  "jeffkreeftmeijer/vim-numbertoggle",
  "kevinhwang91/nvim-bqf",
  "olexsmir/gopher.nvim",
  "leoluz/nvim-dap-go",
  {
    "0x100101/lab.nvim",
    run = "cd js && npm ci",
  },
  "f-person/git-blame.nvim",
  {
    "ruifm/gitlinker.nvim",
    config = function()
      require("user.git").config()
    end,
  },
  "kylechui/nvim-surround",
  "mattn/webapi-vim",
  "folke/zen-mode.nvim",
  "lvimuser/lsp-inlayhints.nvim",
  "lunarvim/darkplus.nvim",
  "lunarvim/templeos.nvim",
  "christoomey/vim-tmux-navigator",
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
  "nvim-treesitter/nvim-treesitter-textobjects",
  {
    "nvim-treesitter/playground",
    event = "BufRead",
  },
  "nvim-treesitter/nvim-treesitter-context",
  "rhysd/conflict-marker.vim",
  {
    "nacro90/numb.nvim",
    event = "BufRead",
  },
  "tpope/vim-unimpaired",
  -- https://github.com/jose-elias-alvarez/typescript.nvim
  {
    "rmagatti/session-lens",
    requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
    config = function()
      require("session-lens").setup({
        theme_conf = { border = false },
        previewer = true,
      })
    end,
  },
  { "simrat39/symbols-outline.nvim" },
  { "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" },
  "mfussenegger/nvim-dap-python",
  "ggandor/leap.nvim",
  "nacro90/numb.nvim",
  "jose-elias-alvarez/typescript.nvim",
  "mxsdev/nvim-dap-vscode-js",
  {
    "saecki/crates.nvim",
    tag = "v0.3.0",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup({
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      })
    end,
  },
  {
    "jinh0/eyeliner.nvim",
    config = function()
      require("eyeliner").setup({
        highlight_on_key = true,
      })
    end,
  },
  {
    "rmagatti/igs.nvim",
    config = function()
      require("igs").setup({})
    end,
  },
  "j-hui/fidget.nvim",
  { "tzachar/cmp-tabnine", run = "./install.sh" },
  {
    "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
    config = function()
      require("copilot").setup({
        plugin_manager_path = os.getenv("LUNARVIM_RUNTIME_DIR") .. "/site/pack/packer",
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}
