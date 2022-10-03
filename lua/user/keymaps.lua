M = {}
lvim.leader = "space"

local opts = { noremap = true, silent = true }
-- For the description on keymaps, I have a function getOptions(desc) which returns noremap=true, silent=true and desc=desc. Then call: keymap(mode, keymap, command, getOptions("some randome desc")

local keymap = vim.keymap.set

keymap("n", "<C-Space>", "<cmd>WhichKey \\<space><cr>", opts)
keymap("n", "<C-i>", "<C-i>", opts)

-- Normal --
-- Better window navigation
keymap("n", "<c-h>", "<C-w>h", opts)
keymap("n", "<c-j>", "<C-w>j", opts)
keymap("n", "<c-k>", "<C-w>k", opts)
keymap("n", "<c-l>", "<C-w>l", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("v", "p", '"_dP', opts)
-- keymap("v", "P", '"_dP', opts)

keymap("n", "Q", "<cmd>Bdelete!<CR>", opts)

keymap(
	"n",
	"<F6>",
	[[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>]],
	opts
)
keymap("n", "<F7>", "<cmd>TSHighlightCapturesUnderCursor<cr>", opts)
keymap("n", "<C-z>", "<cmd>ZenMode<cr>", opts)
keymap("n", "-", ":lua require'lir.float'.toggle()<cr>", opts)
keymap("n", "gx", [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)

keymap("n", "<tab>", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', opts)
keymap(
	"n",
	"<s-tab>",
	"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal'})<cr>",
	opts
)

keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)

-- RANGE FORMAT
keymap("v", "<leader>lf", ":'<,'>lua vim.lsp.buf.range_formatting()<CR>", opts)

vim.cmd([[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  endfunction
]])

-- Repurpose arrow keys for quickfix list movement
keymap("n", "<up>", ":cprevious<cr>", opts)
keymap("n", "<down>", ":cnext<cr>", opts)

keymap("n", "<m-q>", ":call QuickFixToggle()<cr>", opts)

-- Lucky Spelling
keymap("n", "zl", "1z=", opts)

M.show_documentation = function()
	local filetype = vim.bo.filetype
	if vim.tbl_contains({ "vim", "help" }, filetype) then
		---@diagnostic disable-next-line: missing-parameter
		vim.cmd("h " .. vim.fn.expand("<cword>"))
	elseif vim.tbl_contains({ "man" }, filetype) then
		---@diagnostic disable-next-line: missing-parameter
		vim.cmd("Man " .. vim.fn.expand("<cword>"))
	---@diagnostic disable-next-line: missing-parameter
	elseif vim.fn.expand("%:t") == "Cargo.toml" then
		require("crates").show_popup()
	else
		vim.lsp.buf.hover()
	end
end

-- Navigation
keymap("n", "]c", function()
	if vim.wo.diff then
		return "]c"
	end
	vim.schedule(function()
		require("gitsigns").next_hunk()
	end)
	return "<Ignore>"
end, { expr = true })

keymap("n", "[c", function()
	if vim.wo.diff then
		return "[c"
	end
	vim.schedule(function()
		require("gitsigns").prev_hunk()
	end)
	return "<Ignore>"
end, { expr = true })

keymap("n", "K", ":lua require('user.keymaps').show_documentation()<CR>", opts)

--- TEXT OBJECTS
-- Around line: with leading and trailing whitespace
keymap("v", "al", ":<c-u>silent! normal! 0v$<cr>", opts)
keymap("o", "al", ":normal val<cr>", { noremap = false, silent = true })

-- Inner line: without leading or trailing whitespace
keymap("v", "il", ":<c-u>silent! normal! ^vg_<cr>", opts)
keymap("o", "il", ":normal vil<cr>", { noremap = false, silent = true })

-- Whole file, jump back with <c-o>
keymap("v", "ae", "[[:<c-u>silent! normal! m'gg0vg$<cr>]]", opts)
keymap("o", "ae", ":normal Vae<cr>", { noremap = false, silent = true })

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Jaq
keymap("n", "<leader>JJ", ":silent only | Jaq float<cr>", opts)

-- Lab
keymap("n", "<leader>Xr", ":Lab code run<cr>", opts)
keymap("n", "<leader>Xs", ":Lab code stop<cr>", opts)
keymap("n", "<leader>Xp", ":Lab code panel<cr>", opts)

-- Cybu
keymap("n", "H", "<Plug>(CybuPrev)", opts)
keymap("n", "L", "<Plug>(CybuNext)", opts)

return M
