local opt = {

	expandtab = true,
	shiftwidth = 2,
	smartindent = true,
	tabstop = 2,
	softtabstop = 2,

	ignorecase = true,
	smartcase = true,
	mouse = "a",

	number = true,
	relativenumber = true,
	numberwidth = 2,
	ruler = false,

	signcolumn = "yes",
	splitbelow = true,
	splitright = true,
	termguicolors = true,
	undofile = true,

	undodir = os.getenv("HOME") .. "/.vim/undodir",
	swapfile = false,
	backup = false,

	hlsearch = false,
	incsearch = false,

	scrolloff = 8,
	updatetime = 50,

	colorcolumn = "80",
}

for k, v in pairs(opt) do
	vim.opt[k] = v
end

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append("<>[]hl")
vim.opt.isfname:append("@-@")
