local Util = {}

function Util.expand_path(path)
	-- expand ~ to home and relative to current working dir
	local expanded = vim.fn.expand(path)
	-- normalize (resolves .., ., etc)
	local normalized = vim.loop.fs_realpath(expanded) or expanded
	return normalized
end

return Util
