local auto_session_ok, auto_session = pcall(require, "telescope")
if not auto_session_ok then
	return
end

auto_session.setup({
	auto_session_enabled_dirs = {},
	log_level = "error",
	auto_session_suppress_dirs = {
		"/Users/aaronkeisler-primary",
		"/Users/aaronkeisler-primary/projects",
		"/Users/aaronkeisler-primary/Downloads",
		"/",
		"/Users/aaronkeisler-primary/projects/sentijs",
	},
	cwd_change_handling = {
		restore_upcoming_session = true,
		pre_cwd_changed_hook = nil, -- lua function hook. This is called after auto_session code runs for the `DirChangedPre` autocmd
		post_cwd_changed_hook = nil, -- lua function hook. This is called after auto_session code runs for the `DirChanged` autocmd
	},
})

local session_lens_ok, session_lens = pcall(require, "telescope")
if not session_lens_ok then
	return
end
session_lens.setup({
	theme_conf = { border = false },
	previewer = true,
})
