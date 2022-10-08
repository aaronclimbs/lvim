lvim.builtin.which_key.mappings["a"] = { "<cmd>Alpha<cr>", "Alpha" }
lvim.builtin.which_key.mappings["b"] = { "<cmd>Telescope buffers<cr>", "Buffers" }
lvim.builtin.which_key.mappings["v"] = { "<cmd>vsplit<cr>", "vsplit" }
lvim.builtin.which_key.mappings["h"] = { "<cmd>nohlsearch<cr>", "nohl" }
lvim.builtin.which_key.mappings["q"] = { '<cmd>lua require("user.functions").smart_quit()<CR>', "Quit" }
lvim.builtin.which_key.mappings["/"] = { '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', "Comment" }
lvim.builtin.which_key.mappings["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" }
lvim.builtin.which_key.mappings["gy"] = "Link"
lvim.builtin.which_key.mappings["O"] = { "<cmd>SymbolsOutline<cr>", "Outline" }

lvim.builtin.which_key.mappings["r"] = {
	name = "Replace",
	r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
	w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
	f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
}
lvim.builtin.which_key.mappings["d"] = {
	name = "Debug",
	b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
	c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
	i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
	o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
	O = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
	r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
	l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
	u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
	x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
}
lvim.builtin.which_key.mappings["s"] = {
	name = "Find",
	b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
	c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
	f = { "<cmd>Telescope find_files<cr>", "Find files" },
	t = { "<cmd>Telescope live_grep<cr>", "Find Text" },
	s = { "<cmd>Telescope grep_string<cr>", "Find String" },
	S = { "<cmd>:lua require('session-lens').search_session()<cr>", "Search Session" },
	h = { "<cmd>Telescope help_tags<cr>", "Help" },
	H = { "<cmd>Telescope highlights<cr>", "Highlights" },
	l = { "<cmd>Telescope resume<cr>", "Last Search" },
	M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
	r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
	R = { "<cmd>Telescope registers<cr>", "Registers" },
	k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
	C = { "<cmd>Telescope commands<cr>", "Commands" },
}
lvim.builtin.which_key.mappings["g"] = {
	name = "Git",
	g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle(12000)<cr>", "Lazygit" },
	j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
	k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
	L = { "<cmd>GitBlameToggle<cr>", "Blame Toggle" },
	l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame Line" },
	p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
	r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
	R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
	s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
	u = {
		"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
		"Undo Stage Hunk",
	},
	n = { ":!git checkout -b ", "Checkout New Branch" },
	o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
	b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
	c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
	f = { "<cmd>Telescope git_bcommits<cr>", "Checkout buffer commit" },
	d = {
		"<cmd>Gitsigns diffthis HEAD<cr>",
		"Diff",
	},
	n = { "<cmd>Neogit<cr>", "Neogit" },
	y = {
		"<cmd>lua require'gitlinker'.get_buf_range_url('n', {action_callback = require'gitlinker.actions'.copy_to_clipboard, })<cr>",
		"Gitlinker",
		silent = true,
	},
	e = {
		name = "open edited",
		m = { "<cmd>lua require('igs').edit_modified()<cr>", "modified" },
		-- 	s = { "<cmd>lua require('igs').edit_staged()<cr>", "staged" },
		a = { "<cmd>lua require('igs').edit_all()<cr>", "all" },
	},
	q = {
		name = "send to qf",
		m = { "<cmd>lua require('igs').qf_modified()<cr>", "modified" },
		s = { "<cmd>lua require('igs').qf_staged()<cr>", "staged" },
		a = { "<cmd>lua require('igs').qf_all()<cr>", "all" },
	},
	h = {
		name = "Hub",
		p = { "<cmd>Octo pr list<cr>", "List PRs" },
		i = { "<cmd>Octo issue list<cr>", "List Issues" },
		s = { "<cmd>Octo review start<cr>", "Start Review" },
		r = { "<cmd>Octo review resume<cr>", "Resume Review" },
	},
}

lvim.builtin.which_key.mappings["lc"] =
	{ "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<cr>", "Get Capabilities" }
lvim.builtin.which_key.mappings[";"] = nil
lvim.builtin.which_key.mappings["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" }
lvim.builtin.which_key.mappings["f"] = { require("lvim.core.telescope.custom-finders").find_project_files, "Find File" }
lvim.builtin.which_key.mappings["w"] = { "<cmd>w!<CR>", "Save" }

local m_opts = {
	mode = "n", -- NORMAL mode
	prefix = "m",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local m_mappings = {
	a = { "<cmd>silent BookmarkAnnotate<cr>", "Annotate" },
	c = { "<cmd>silent BookmarkClear<cr>", "Clear" },
	b = { "<cmd>silent BookmarkToggle<cr>", "Toggle" },
	m = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Harpoon" },
	["."] = { '<cmd>lua require("harpoon.ui").nav_next()<cr>', "Harpoon Next" },
	[","] = { '<cmd>lua require("harpoon.ui").nav_prev()<cr>', "Harpoon Prev" },
	l = { "<cmd>lua require('user.bfs').open()<cr>", "Buffers" },
	j = { "<cmd>silent BookmarkNext<cr>", "Next" },
	s = { "<cmd>Telescope harpoon marks<cr>", "Search Files" },
	k = { "<cmd>silent BookmarkPrev<cr>", "Prev" },
	S = { "<cmd>silent BookmarkShowAll<cr>", "Prev" },
	-- s = {
	--   "<cmd>lua require('telescope').extensions.vim_bookmarks.all({ hide_filename=false, prompt_title=\"bookmarks\", shorten_path=false })<cr>",
	--   "Show",
	-- },
	x = { "<cmd>BookmarkClearAll<cr>", "Clear All" },
	[";"] = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Harpoon UI" },
}

which_key.register(m_mappings, m_opts)
