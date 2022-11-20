if lvim.colorscheme == "darkplus" then
  lvim.builtin.treesitter.rainbow = {
    enable = true,
    extended_mode = false,
    colors = {
      "Orchid",
      "DodgerBlue",
      "Gold",
    },
    disable = { "html" },
  }
end

lvim.builtin.treesitter.textobjects = {
	select = {
		enable = true,
		-- Automatically jump forward to textobj, similar to targets.vim
		lookahead = true,
		keymaps = {
			-- You can use the capture groups defined in textobjects.scm
			["af"] = "@function.outer",
			["if"] = "@function.inner",
			["at"] = "@class.outer",
			["it"] = "@class.inner",
			["ac"] = "@call.outer",
			["ic"] = "@call.inner",
			["aa"] = "@parameter.outer",
			["ia"] = "@parameter.inner",
			["al"] = "@loop.outer",
			["il"] = "@loop.inner",
			["ai"] = "@conditional.outer",
			["ii"] = "@conditional.inner",
			["a/"] = "@comment.outer",
			["i/"] = "@comment.inner",
			["ab"] = "@block.outer",
			["ib"] = "@block.inner",
			["as"] = "@statement.outer",
			["is"] = "@scopename.inner",
			["aA"] = "@attribute.outer",
			["iA"] = "@attribute.inner",
			["aF"] = "@frame.outer",
			["iF"] = "@frame.inner",
		},
	},
}

lvim.builtin.treesitter.highlight.additional_vim_regex_highlighting = { "markdown" }
